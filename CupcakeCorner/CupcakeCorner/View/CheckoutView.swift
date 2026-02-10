//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Stoyan Hristov on 8.02.26.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string:"https://hws.dev/img/cupcakes@3x.jpg"),scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
            }
            
            Text("Your total cost is \(order.cost, format: .currency(code: "USD").locale(Locale(identifier: "en_US")))")
                .font(.title)
            
            Button("Place an order") {
                Task {
                    await sendOrder()
                }
            }
            .padding()
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle, isPresented: $showAlert) {} message: {
            Text(alertMessage)
        }
    }
    
    func sendOrder() async {
        guard let encodedData = try? JSONEncoder().encode(order) else {
            print("Failed to encode order")
            return
        }
        
        let url = URL(string: "https://httpbin.org/post")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, response ) = try await URLSession.shared.upload(for: request, from: encodedData)
            
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                print("Server error")
                return
            }
            
            let decodedOrderFromRequest = try JSONDecoder().decode(HttpBinResponse.self, from: data)
            
            alertMessage = "Your order for \(decodedOrderFromRequest.json.quantity)x \(Order.types[decodedOrderFromRequest.json.typeIndex].lowercased()) cupcakes is on its way!"
            
            showAlert = true
        } catch {
            if let _ = error as? URLError{
                alertTitle = "No network"
                alertMessage = "Please check your internet connection or disable Airplane mode"
                showAlert = true
            }
            print("Checkout failed: \(error.localizedDescription)")
        }
    }
}

#Preview {
    
    NavigationStack {
        CheckoutView(order: Order())
    }
    
}

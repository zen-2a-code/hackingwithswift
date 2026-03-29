//
//  MeView.swift
//  HotProspects
//
//  Created by Stoyan Hristov on 25.03.26.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct MeView: View {
    @AppStorage("name") private var name = ""
    @AppStorage("email") private var email = ""
    @State private var qrUIImage: UIImage = .init()
    
    private let coreImageContext = CIContext()
    private let qrFilter = CIFilter.qrCodeGenerator()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Please enter your name", text: $name)
                    .font(.title)
                    .textContentType(.name)
                TextField("Please enter your email", text: $email)
                    .font(.title)
                    .textContentType(.emailAddress)
                
                Image(uiImage: qrUIImage)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrUIImage), preview: SharePreview("My QR Code", image: Image(uiImage: qrUIImage)))
                    }
            }
            .navigationTitle("Your QR code")
            .onAppear(perform: updateQRUIImage)
            .onChange(of: name, updateQRUIImage)
            .onChange(of: email, updateQRUIImage)
        }
    }
    
    func updateQRUIImage() {
        qrUIImage = generateQrCode(string: "\(name)\n\(email)")
    }
    
        func generateQrCode(string: String) -> UIImage {
            qrFilter.message = Data(string.utf8)
            
            if let ciOutputImage = qrFilter.outputImage {
                if let cgOutputImage = coreImageContext.createCGImage(ciOutputImage, from: ciOutputImage.extent) {
                    return UIImage(cgImage: cgOutputImage)
                }
            }
    
        return UIImage(systemName: "xmark.circle")!
    }
}

#Preview {
    MeView()
}

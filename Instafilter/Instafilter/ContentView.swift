//
//  ContentView.swift
//  Instafilter
//
//  Created by Stoyan Hristov on 7.03.26.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import PhotosUI
import StoreKit
import SwiftUI

struct ContentView: View {
    @AppStorage("filterCount") var filterCount = 0
    @Environment(\.requestReview) var requestReview
    
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 10.0
    @State private var selectedItem: PhotosPickerItem?
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    @State private var showingFilters = false
    private var shouldDisableButton: Bool { selectedItem == nil }
    @State private var beginImage: CIImage?
    let context = CIContext()

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                PhotosPicker(selection: $selectedItem) {
                    if let processedImage {
                        processedImage
                            .resizable()
                            .scaledToFit()
                    } else {
                        ContentUnavailableView("No picture", systemImage:
                                                "photo.badge.plus", description: Text("Tap to import a photo"))
                    }
                }
                .buttonStyle(.plain)
                .onChange(of: selectedItem, loadImage)

                Spacer()

                HStack {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                        .disabled(shouldDisableButton)
                        .onChange(of: filterIntensity, applyProcessing)
                }
                .padding(.top)
                
                HStack {
                    Text("Radius")
                    Slider(value: $filterRadius, in: 0...1000)
                        .disabled(shouldDisableButton)
                        .onChange(of: filterRadius, applyProcessing)
                }
                .padding(.bottom)

                HStack {
                    Button("Change Filter", action: changeFilter)
                        .disabled(shouldDisableButton)

                    Spacer()

                    if let processedImage {
                        ShareLink(item: processedImage, preview: SharePreview("Instafilter image", image: processedImage))
                    }
                }
            }
            .navigationTitle("Instafilter")
            .confirmationDialog("Select a filter", isPresented: $showingFilters) {
                Button("Crystallize") { setFilter(CIFilter.crystallize()) }
                Button("Edges") { setFilter(CIFilter.edges()) }
                Button("Gaussian Blur") { setFilter(CIFilter.gaussianBlur()) }
                Button("Pixellate") { setFilter(CIFilter.pixellate()) }
                Button("Sepia Tone") { setFilter(CIFilter.sepiaTone()) }
                Button("Unsharp Mask") { setFilter(CIFilter.unsharpMask()) }
                Button("Vignette") { setFilter(CIFilter.vignette()) }
                Button("Bloom") { setFilter(CIFilter.bloom()) }
                Button("Twirl Distortion") { setFilter(CIFilter.twirlDistortion()) }
                Button("Comic Effect") { setFilter(CIFilter.comicEffect()) }
            }
            .padding([.horizontal, .bottom])
        }
    }

    func changeFilter() {showingFilters.toggle()}
    
    @MainActor func setFilter(_ filter: CIFilter) {
        currentFilter = filter
//        print(currentFilter.name)
//        print(currentFilter.inputKeys)
        filterIntensity = 0.5
        filterRadius = 10
        filterCount += 1
        
        if filterCount >= 20 {
            requestReview()
        }
        loadImage()
    }
    
     func loadImage() {
        Task {
            guard let imageData = try await selectedItem?.loadTransferable(type: Data.self) else { return }
            guard let inputImage = UIImage(data: imageData) else { return }

            beginImage = CIImage(image: inputImage)
            currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
            applyProcessing()
        }
    }
     func applyProcessing() {
        let inputKeys = currentFilter.inputKeys

        if inputKeys.contains(kCIInputIntensityKey) { currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) { currentFilter.setValue(filterRadius, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) { currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }
        if inputKeys.contains(kCIInputAngleKey) {currentFilter.setValue(filterIntensity * .pi * 2, forKey: kCIInputAngleKey)}
        if currentFilter.inputKeys.contains(kCIInputCenterKey) {
             currentFilter.setValue(
                CIVector(x: beginImage?.extent.midX ?? 0.0, y: beginImage?.extent.midY ?? 0.0),
                 forKey: kCIInputCenterKey
             )
         }

        guard let outputImage = currentFilter.outputImage else { return }
        guard let cgImage = context.createCGImage(outputImage, from: outputImage.extent) else { return }

        let uiImage = UIImage(cgImage: cgImage)
        processedImage = Image(uiImage: uiImage)
    }
}

#Preview {
    ContentView()
}

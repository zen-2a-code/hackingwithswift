//
//  LoadingPhotosFromUsersPhotoLibraryView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 6.03.26.
//

import SwiftUI
import PhotosUI


struct LoadingMultiplePhotosFromUsersPhotoLibraryView: View {
    @State private var pickerItems: [PhotosPickerItem] = [PhotosPickerItem]()
    @State private var selectedImages = [Image]()
    
    var body: some View {
        VStack {
            PhotosPicker("Select an image", selection: $pickerItems, matching: .images)
            
            ScrollView {
                ForEach (0..<selectedImages.count, id: \.self) { index in
                    selectedImages[index]
                        .resizable()
                        .scaledToFit()
                }
            }
        }
        
        .onChange(of: pickerItems) {
            Task {
                selectedImages.removeAll()
                
                for item in pickerItems {
                    if let loadedImage = try await item.loadTransferable(type: Image.self) {
                        selectedImages.append(loadedImage)
                    }
                }
//                await loadImages()
            }
        }
    }
    
    /**
         Loads all selected photos from the user's photo library.

         Each photo is loaded as raw `Data`, converted to `UIImage`,
         and then wrapped into a SwiftUI `Image`.

         This approach is preferred over loading `Image.self` directly because
         `UIImage` handles photo orientation metadata more reliably.
         */
        private func loadImages() async {
            selectedImages.removeAll()

            do {
                for item in pickerItems {
                    guard let data = try await item.loadTransferable(type: Data.self) else {
                        continue
                    }

                    guard let uiImage = UIImage(data: data) else {
                        continue
                    }

                    let swiftUiImage = Image(uiImage: uiImage)
                    selectedImages.append(swiftUiImage)
                }
            } catch {
                selectedImages.removeAll()
                print("Failed to load images: \(error.localizedDescription)")
            }
        }
}

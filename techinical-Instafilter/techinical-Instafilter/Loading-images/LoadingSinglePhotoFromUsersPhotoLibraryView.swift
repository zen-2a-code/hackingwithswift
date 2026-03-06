//
//  LoadingPhotosFromUsersPhotoLibraryView.swift
//  techinical-Instafilter
//
//  Created by Stoyan Hristov on 6.03.26.
//

import SwiftUI
import PhotosUI


struct LoadingSinglePhotoFromUsersPhotoLibraryView: View {
    @State private var pickerItem: PhotosPickerItem?
    @State private var selectedImage: Image?
    
    var body: some View {
        VStack {
            PhotosPicker("Select an image", selection: $pickerItem, matching: .images)
            
            selectedImage?
                .resizable()
                .scaledToFit()
        }
        
        .onChange(of: pickerItem) {
            Task {
                ///Here we load the image as SwiftUI.Image directly, and that path can lose or mishandle the original orientation info, so the image appears rotated, because the picked photo often contains orientation metadata instead of physically rotated pixels.
                selectedImage = try await pickerItem?.loadTransferable(type: Image.self)
//                await loadImage()
            }
        }
    }
    
    /**
     Loads the selected photo from the user's photo library.

     The image is first loaded as raw `Data`, then converted to `UIImage`,
     and finally wrapped into a SwiftUI `Image`.

     This approach is preferred over loading `Image.self` directly because
     `UIImage` handles photo orientation metadata more reliably.
     */
    private func loadImage() async {
        do {
            guard let data = try await pickerItem?.loadTransferable(type: Data.self) else {
                selectedImage = nil
                return
            }

            guard let uiImage = UIImage(data: data) else {
                selectedImage = nil
                return
            }

            selectedImage = Image(uiImage: uiImage)
        } catch {
            selectedImage = nil
            print("Failed to load image: \(error.localizedDescription)")
        }
    }
}

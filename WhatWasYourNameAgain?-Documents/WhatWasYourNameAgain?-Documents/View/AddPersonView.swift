//
//  AddPersonView.swift
//  WhatWasYourNameAgain?-Documents
//
//  Created by Stoyan Hristov on 20.03.26.
//

import CoreLocation
import PhotosUI
import SwiftUI

struct AddPersonView: View {
    @State private var viewModel = ViewModel()
    @State private var pickedImage: PhotosPickerItem?
    @State private var imagePreview: Image?
    @Environment(\.dismiss) private var dismiss
    var onSave: (String, Data, CLLocationCoordinate2D) -> Void

    var body: some View {
        Form {
            TextField("Name", text: $viewModel.name)
            PhotosPicker(selection: $pickedImage, matching: .images) {
                HStack(spacing: 10) {
                    Label("Add photo", systemImage: "plus")

                    if let imagePreview {
                        imagePreview
                            .resizable()
                            .scaledToFit()
                            .frame(height: 33)
                    }
                }
            }
            .onChange(of: pickedImage) {
                Task {
                    await imageFromPickedImage()
                }
            }

            Section {
                Button("Save", systemImage: "plus.capsule.fill") {
                    if let data = viewModel.data {
                        viewModel.locationFetcher.start()
                        if let currentUserLocation = viewModel.locationFetcher.lastKnownLocation {
                            onSave(viewModel.name, data, currentUserLocation)
                            dismiss()
                        }
                    }
                }
                .disabled(!viewModel.canSave())
            }
        }
        .navigationTitle("Add new person")
    }

    func imageFromPickedImage() async {
        guard let pickedImage else { return }
        do {
            if let data = try await pickedImage.loadTransferable(type: Data.self) {
                viewModel.data = data
                if let uiImage = UIImage(data: data) {
                    imagePreview = Image(uiImage: uiImage)
                }
            }
        } catch {
            print("Unable to load image from galary")
            return
        }
    }
}

#Preview {
    NavigationStack {
        AddPersonView(onSave: { _, _, _ in })
    }
}

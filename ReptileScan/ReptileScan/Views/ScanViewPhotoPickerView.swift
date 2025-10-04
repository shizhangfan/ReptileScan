//
//  ScanViewPhotoPickerView.swift
//  ReptileScan
//
//  Created by shizf on 2025/10/4.
//

import SwiftUI
import PhotosUI
import UIKit

struct ScanViewPhotoPickerView: View {
    @Binding var image: UIImage?
    @State private var selectedItem: PhotosPickerItem? = nil

    var body: some View {
        PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()) {
            Label("Photo Library", systemImage: "photo.on.rectangle")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .task(id: selectedItem) {
            guard let item = selectedItem else { return }
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                image = uiImage
            }
        }
    }
}

#Preview("PhotoPicker", traits: .sizeThatFitsLayout) {
    ScanViewPhotoPickerView(image: .constant(nil))
        .padding()
}

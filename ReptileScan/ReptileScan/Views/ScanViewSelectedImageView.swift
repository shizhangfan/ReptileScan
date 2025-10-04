//
//  ScanViewSelectedImageView.swift
//  ReptileScan
//
//  Created by shizf on 2025/10/4.
//

import SwiftUI
import UIKit

struct ScanViewSelectedImageView: View {
    @Binding var image: UIImage?
    
    var body: some View {
        if let uiImage = image {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .overlay(alignment: .bottomTrailing) {
                    Button {
                        self.image = nil
                    } label: {
                        Label("Clear", systemImage: "xmark.circle.fill")
                            .labelStyle(.iconOnly)
                            .font(.title2)
                            .padding(8)
                            .background(.ultraThinMaterial, in: Capsule())
                    }
                    .padding(8)
                }
        }
        
    }
}

// Static previews
#Preview("Empty") {
    ScanViewSelectedImageView(image: .constant(nil))
        .padding()
}

#Preview("With Image") {
    ScanViewSelectedImageView(image: .constant(UIImage(systemName: "photo")))
        .padding()
}

// Interactive preview (clear button works)
private struct ScanViewSelectedImageView_PreviewContainer: View {
    @State private var image: UIImage? = UIImage(systemName: "photo")
    var body: some View {
        ScanViewSelectedImageView(image: $image)
            .padding()
    }
}

#Preview("Interactive") {
    ScanViewSelectedImageView_PreviewContainer()
}

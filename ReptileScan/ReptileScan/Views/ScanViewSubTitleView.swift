//
//  ScanViewSubTitle.swift
//  ReptileScan
//
//  Created by shizf on 2025/10/4.
//

import SwiftUI

struct ScanViewSubTitleView: View {
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: "camera.viewfinder")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            Text("Add a photo to identify")
                .font(.headline)
            Text("Choose from your library or take a new photo. We'll use it to identify the species.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

#Preview {
    ScanViewSubTitleView()
}

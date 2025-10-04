import SwiftUI

struct ScanView: View {
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: "camera.viewfinder")
                .font(.system(size: 48))
                .foregroundStyle(.secondary)
            Text("Scan")
                .font(.title.bold())
            Text("Start by capturing a reptile photo to identify species.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.secondary)
        }
        .padding()
        .navigationTitle("Scan")
    }
}

#Preview {
    NavigationStack { ScanView() }
}

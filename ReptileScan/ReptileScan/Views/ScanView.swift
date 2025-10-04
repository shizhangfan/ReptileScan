import SwiftUI
import PhotosUI

struct ScanView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var image: UIImage? = nil
    @State private var showCamera = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if image != nil {
                    ScanViewSelectedImageView(image: $image)
                } else {
                    ScanViewSubTitleView()
                }
                
                HStack(spacing: 12) {
                    ScanViewPhotoPickerView(image: $image)
                    showCameraBtn
                }
                
                if image != nil {
                    Button {
                        // Placeholder: trigger identification next step
                    } label: {
                        Label("Identify Species", systemImage: "sparkles")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
            }
            .padding()
        }
        .navigationTitle("Scan")
        .task(id: selectedItem) {
            guard let item = selectedItem else { return }
            if let data = try? await item.loadTransferable(type: Data.self),
               let uiImage = UIImage(data: data) {
                self.image = uiImage
            }
        }
        .sheet(isPresented: $showCamera) {
            ScanViewCameraPickerView(image: $image)
                .ignoresSafeArea()
        }
    }
    
    // Show camera button
    private var showCameraBtn: some View {
        Button {
            showCamera = true
        } label: {
            Label("Camera", systemImage: "camera")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.bordered)
        .disabled(!UIImagePickerController.isSourceTypeAvailable(.camera))
        .opacity(UIImagePickerController.isSourceTypeAvailable(.camera) ? 1 : 0.5)
    }
}

#Preview {
    NavigationStack { ScanView() }
}


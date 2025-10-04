import SwiftUI

struct SettingsView: View {
    @State private var useOnlineID = true
    @State private var sharePreciseLocation = false

    var body: some View {
        Form {
            Section("Identification") {
                Toggle("Use online identification", isOn: $useOnlineID)
                Toggle("Share precise location", isOn: $sharePreciseLocation)
            }
            Section("About") {
                HStack {
                    Text("App Version")
                    Spacer()
                    Text(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "-")
                        .foregroundStyle(.secondary)
                }
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack { SettingsView() }
}

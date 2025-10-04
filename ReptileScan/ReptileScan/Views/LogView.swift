import SwiftUI

struct LogView: View {
    var body: some View {
        List {
            Section("Recent Sightings") {
                ForEach(0..<5, id: \.self) { i in
                    HStack {
                        Image(systemName: "photo")
                            .foregroundStyle(.secondary)
                        VStack(alignment: .leading) {
                            Text("Sighting #\(i + 1)")
                            Text("Tap to view details")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .navigationTitle("Log")
    }
}

#Preview {
    NavigationStack { LogView() }
}

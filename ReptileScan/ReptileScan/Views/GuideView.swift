import SwiftUI

struct GuideView: View {
    @State private var query: String = ""

    var body: some View {
        List {
            Section {
                ForEach(0..<10, id: \.self) { i in
                    HStack {
                        Image(systemName: "tortoise")
                            .foregroundStyle(.secondary)
                        VStack(alignment: .leading) {
                            Text("Species #\(i + 1)")
                            Text("Common name")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
        }
        .searchable(text: $query, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Guide")
    }
}

#Preview {
    NavigationStack { GuideView() }
}

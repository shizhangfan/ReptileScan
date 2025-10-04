//
//  ContentView.swift
//  ReptileScan
//
//  Created by shizf on 2025/10/4.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                ScanView()
            }
            .tabItem {
                Label("Scan", systemImage: "camera.viewfinder")
            }
            .tag(0)

            NavigationStack {
                LogView()
            }
            .tabItem {
                Label("Log", systemImage: "list.bullet.rectangle")
            }
            .tag(1)

            NavigationStack {
                GuideView()
            }
            .tabItem {
                Label("Guide", systemImage: "book.closed")
            }
            .tag(2)

            NavigationStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gearshape")
            }
            .tag(3)
        }
    }
}

#Preview {
    ContentView()
}

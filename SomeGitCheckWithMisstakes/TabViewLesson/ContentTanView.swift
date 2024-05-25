//
//  ContentTanView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 25.05.2024.
//

import SwiftUI

struct ContentTanView: View {
    @State private var activTab:DummyTab = .home
    var body: some View {
        VStack(spacing:15) {
            TabView(selection: $activTab) {
                DummyTab.charts.color
                    .tag(DummyTab.charts)
                
                DummyTab.home.color
                    .tag(DummyTab.home)
                
                DummyTab.calls.color
                    .tag(DummyTab.calls)
                
                DummyTab.settings.color
                    .tag(DummyTab.settings)
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
        }
    }
}

#Preview {
    ContentTanView()
}

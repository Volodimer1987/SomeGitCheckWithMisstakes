//
//  ContentView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image("tree")
                .resizable()
                .aspectRatio(contentMode: .fill)
            Text("Hello, world!")
        }
    }
}

#Preview {
    ContentView()
}

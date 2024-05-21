//
//  ContentView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment:.center) {
            Image("tree")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            Text("This new check with new repo in git")
                .font(.system(size: 23, weight: .semibold))    .foregroundStyle(.green)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}

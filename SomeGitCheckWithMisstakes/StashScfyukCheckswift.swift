//
//  StashScfyukCheckswift.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct StashScfyukCheckswift: View {
    var body: some View {
        ZStack {
            Image("someHead")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            Text("Stash check")
                .foregroundStyle(.red)
        }
        
    }
}

#Preview {
    StashScfyukCheckswift()
}

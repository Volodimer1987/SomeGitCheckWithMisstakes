//
//  SomeFolderCheckBranch.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct SomeFolderCheckBranch: View {
    var body: some View {
        ZStack {
            Image("god")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            Text("This is from folder branch")
                .foregroundStyle(Color.green)
                .font(.largeTitle)
        }
    }
}

#Preview {
    SomeFolderCheckBranch()
}

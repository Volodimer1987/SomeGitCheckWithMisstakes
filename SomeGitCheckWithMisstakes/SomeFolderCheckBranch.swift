//
//  SomeFolderCheckBranch.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct SomeFolderCheckBranch: View {
    @State private var someCheckChange = ""
    
    var body: some View {
        ZStack {
            Image("god")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack(spacing: 20 , content: {
                Text("This is from folder branch")
                    .foregroundStyle(Color.green)
                    .font(.largeTitle)
                
                Text(someCheckChange)
                    .font(.title)
                    .foregroundStyle(.yellow)
            })
        }
        .task {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                someCheckChange = "This is new lesson from nick"
            })
            DispatchQueue.global().asyncAfter(deadline: .now() + 5) {
                someCheckChange = ""
            }
        }
        
    }
}

#Preview {
    SomeFolderCheckBranch()
}

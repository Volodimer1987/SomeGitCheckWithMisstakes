//
//  StashScfyukCheckswift.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 21.05.2024.
//

import SwiftUI

struct StashScfyukCheckswift: View {
    @State private var showBoolTransition = false
    @State var workText = "This is bobby or not"
    var body: some View {
        ZStack {
            Image("someHead")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea(.all)
            
            VStack(spacing:20) {
                Text("Stash check")
                    .foregroundStyle(.red)
                
                Button {
                    withAnimation {
                        showBoolTransition.toggle()
                        if showBoolTransition {
                            workText = "This is bobby god boy"
                        } else {
                            workText = "This is die"
                        }
                    }
                } label: {
                    Text("Transitinon move")
                }.background {
                    Capsule(style: .circular)
                        .strokeBorder(Color.black, lineWidth: 0.8)
                        .background(Capsule().fill(.blue.opacity(0.2)))
                }
                
                Text("\(workText)")
                    .fontDesign(.monospaced)
                    .font(.title)
                 .padding()
                 .background(Color.pink)
                 .cornerRadius(10.0)
                 .transition(showBoolTransition == true ? .scale:.opacity)

                Text("Default Font")
                    .font(.system(size: 24))
                    .fontDesign(.monospaced)
            }
            
           

        }
        
    }
}

#Preview {
    StashScfyukCheckswift()
}

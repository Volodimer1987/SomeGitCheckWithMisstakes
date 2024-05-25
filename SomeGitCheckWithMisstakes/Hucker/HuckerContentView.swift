//
//  HuckerContentView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 24.05.2024.
//

import SwiftUI

struct HuckerContentView: View {
    
    @State private var trigger:Bool = false
    @State private var myText = "This is Hucker Bobby"
    var body: some View {
        VStack(alignment:.leading,spacing: 12) {
            HackerTextView(text:myText,
                           trigger: trigger,
                           transition: .numericText(),
                           speed: 0.09)
                .font(.largeTitle.bold())
                .lineLimit(2)
            
            Button("Trigger") {
                trigger.toggle()
                if myText == "This is Hucker Bobby" {
                    myText = "No no this only video check"
                } else if myText == "No no this only video check" {
                    myText = "This is Hucker Bobby" 
                }
              
            }
            .fontWeight(.semibold)
            .padding(.horizontal,15)
            .padding(.vertical,2)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .frame(maxWidth:.infinity)
            .padding(.top,30)
        }
        .padding(15)
        .frame(maxWidth:.infinity,alignment: .leading)
    }
}

#Preview {
    HuckerContentView()
}

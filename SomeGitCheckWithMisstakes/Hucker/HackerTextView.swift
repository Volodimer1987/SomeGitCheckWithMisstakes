//
//  HackerTextView.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 24.05.2024.
//

import SwiftUI

struct HackerTextView: View {
    
    var text:String
    var trigger:Bool
    var transition:ContentTransition = .interpolate
    var duration:CGFloat = 0.4
    var speed:CGFloat = 1.0
    
    @State private var animationId:String = UUID().uuidString
    @State private var animatedText = ""
    @State private var randomCharapters:[Character] = {
        let string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUWVXYZ0123456789-?/#$%@! ^&*()="
        return Array(string)
    }()

    var body: some View {
        Text(animatedText)
            .fontDesign(.monospaced)
            .truncationMode(.tail)
            .contentTransition(transition)
            .animation(.easeInOut,value: animatedText)
            .onAppear {
                guard animatedText.isEmpty else {return}
                setRandomCharapters()
                animateText()
            }
            .customOnChange(value: trigger) { value in
                animateText()
            }
            .customOnChange(value: text) { newValue in
                animatedText = text
                animationId = UUID().uuidString
                setRandomCharapters()
                animateText()
            }
    }
    
    private func animateText() {
        let currenId = animationId
        for index in text.indices {
            let delay = CGFloat.random(in:0...duration)
            var timerDuration:CGFloat = 0
            let timer = Timer.scheduledTimer(withTimeInterval: speed, repeats: true) { timer in
                if currenId != animationId {
                    timer.invalidate()
                } else {
                    timerDuration += speed
                    if timerDuration >= delay {
                            if text.indices.contains(index) {
                                let actualCharapter = text[index]
                                replaceCharapterAt(index: index, charapter: actualCharapter)
                            }
                    } else {
                        guard  let randomCharapter = randomCharapters.randomElement() else {return}
                        replaceCharapterAt(index: index, charapter: randomCharapter)
                    }
                }
            }
            timer.fire()
            
        }
    }
    
    private func setRandomCharapters() {
        animatedText = text
        for index in animatedText.indices {
            guard let randomCharapter = randomCharapters.randomElement() else {return}
            replaceCharapterAt(index: index, charapter: randomCharapter)
        }
        
    }
    
    func replaceCharapterAt(index:String.Index,charapter:Character) {
        guard animatedText.indices.contains(index) else {return}
        let indexCharapter = String(animatedText[index])
        if indexCharapter.trimmingCharacters(in: .whitespacesAndNewlines) != " " {
            animatedText.replaceSubrange(index...index, with: String(charapter))
        }
    }
}


fileprivate extension View {
    @ViewBuilder
    func customOnChange<T:Equatable>(value:T,result:@escaping (T)->()) -> some View {
        if #available(iOS 17, *) {
            self.onChange(of: value) { oldValue, newValue in
                result(newValue)
            }
        } else {
            self.onChange(of: value) { newValue in
                result(newValue)
            }
        }
    }
}

#Preview {
    HuckerContentView()
}


//
//  Tab.swift
//  SomeGitCheckWithMisstakes
//
//  Created by vladimir gennadievich on 25.05.2024.
//

import SwiftUI
 
enum DummyTab:String,CaseIterable {
case home = "Home"
case charts = "Charts"
case calls = "Calls"
case settings = "Settings"
   
    var color:Color {
        switch self {
        case .home:return .red
        case .charts:return .blue
        case .calls:return .black
        case .settings:return .purple
        }
    }

}

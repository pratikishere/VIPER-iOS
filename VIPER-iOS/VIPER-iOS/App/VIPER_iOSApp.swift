//
//  VIPER_iOSApp.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

@main
struct VIPER_iOSApp: App {
    private let loginState = LoginViewState()
    
    var body: some Scene {
        WindowGroup {
            LoginView(state: loginState)
        }
    }
}

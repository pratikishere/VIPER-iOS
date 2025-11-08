//
//  VIPER_iOSApp.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

@main
struct VIPER_iOSApp: App {
    var body: some Scene {
        WindowGroup {
            LoginModuleBuilder.build()
        }
    }
}

struct LoginModuleBuilder {
    static func build(with state: LoginViewState = LoginViewState()) -> some View {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor)
        return LoginView(state: state, presenter: presenter)
    }
}

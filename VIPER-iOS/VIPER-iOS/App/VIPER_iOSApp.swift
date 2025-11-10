//
//  SceneDelegate.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import SwiftUI

@main
struct VIPER_iOSApp: App {  // Replace "YourApp" with your actual app name
    var body: some Scene {
        WindowGroup {
            // Host the UIKit VC inside SwiftUI
            UIKitRepresentedView(rootView: LoginModuleBuilder.build())
                .ignoresSafeArea()  // Full screen
        }
    }
}

struct LoginModuleBuilder {
    static func build() -> UIViewController {
        let viewController = LoginViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        let interactor = LoginInteractor()
        let router = LoginRouter(navigationController: navigationController)
        let presenter = LoginPresenter(interactor: interactor, router: router)
        viewController.presenter = presenter
        presenter.view = viewController
        return navigationController
    }
}

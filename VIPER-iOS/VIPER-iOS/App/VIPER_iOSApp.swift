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
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(interactor: interactor)
        let viewController = LoginViewController()
        viewController.presenter = presenter
        presenter.view = viewController
        return UINavigationController(rootViewController: viewController)
    }
}

struct UIKitRepresentedView<RootView: UIViewController>: UIViewControllerRepresentable {
    let rootView: RootView
    
    func makeUIViewController(context: Context) -> RootView {
        rootView
    }
    
    func updateUIViewController(_ uiViewController: RootView, context: Context) {}
}

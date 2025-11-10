//
//  LoginRouter.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import UIKit

protocol LoginRouterProtocol: AnyObject {
    func navigateToHome(user: User)
}

final class LoginRouter: LoginRouterProtocol {
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        debugPrint("LoginRouter deinit")
    }
    
    func navigateToHome(user: User) {
        guard let navigationController else { return }
        let presenter = HomePresenter(user: user)
        let homeViewController = HomeViewController()
        homeViewController.presenter = presenter
        presenter.view = homeViewController
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

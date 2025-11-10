//
//  LoginRouter.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import UIKit

public protocol LoginRouterProtocol: AnyObject {
    func navigateToHome(user: User)
}

public class LoginRouter: LoginRouterProtocol {
    public weak var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    deinit {
        debugPrint("LoginRouter deinit")
    }
    
    public func navigateToHome(user: User) {
        guard let navigationController else { return }
        let presenter = HomePresenter(user: user)
        let homeViewController = HomeViewController()
        homeViewController.presenter = presenter
        presenter.view = homeViewController
        navigationController.pushViewController(homeViewController, animated: true)
    }
}

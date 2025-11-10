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
    weak var navigationController: UINavigationController?
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    public func navigateToHome(user: User) {
        let presenter = HomePresenter(user: user)
        let homeViewController = HomeViewController()
        homeViewController.presenter = presenter
        presenter.view = homeViewController
        navigationController?.pushViewController(homeViewController, animated: true)
    }
}

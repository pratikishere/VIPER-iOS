//
//  MockLoginRouter.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 9/11/2025.
//

import VIPER_iOS

class MockLoginRouter: LoginRouterProtocol {
    var onNavigateToHome: ((User) -> Void)?
    
    func navigateToHome(user: User) {
        onNavigateToHome?(user)
    }
}

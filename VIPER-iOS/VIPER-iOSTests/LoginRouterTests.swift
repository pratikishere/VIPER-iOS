//
//  LoginRouterTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 9/11/2025.
//

import XCTest
import VIPER_iOS

class MockNavigationController: UINavigationController {
    var pushedViewControllers = [UIViewController]()
    var lastPushAnimated: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewControllers.append(viewController)
        lastPushAnimated = animated
    }
}

final class LoginRouterTests: XCTestCase {
    
    private var router: LoginRouter!
    private var navigationController: MockNavigationController!

    override func setUp() {
        super.setUp()
        navigationController = MockNavigationController()
        router = LoginRouter(navigationController: navigationController)
    }

    override func tearDown() {
        router = nil
        super.tearDown()
    }
    
    func test_navigateToHome_pushHomeViewControllerWithCorrectUser() {
        let user = User(email: "test@example.com", password: "password")
        router.navigateToHome(user: user)
        
        XCTAssertEqual(navigationController.pushedViewControllers.count, 1)
        guard let pushedViewController = navigationController.pushedViewControllers.first as? HomeViewController else {
            XCTFail("Expected HomeViewController")
            return
        }
        
        XCTAssertNotNil(pushedViewController.presenter)
        XCTAssertEqual((pushedViewController.presenter as? HomePresenter)?.user.email, user.email)
    }
    
    func test_navigateToHome_pushedIsAnimated() {
        router.navigateToHome(user: User(email: "", password: ""))
        XCTAssertTrue(navigationController.lastPushAnimated ?? false)
    }
}

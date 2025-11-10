//
//  MockNavigationController.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 9/11/2025.
//

import UIKit

class MockNavigationController: UINavigationController {
    var pushedViewControllers = [UIViewController]()
    var lastPushAnimated: Bool?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushedViewControllers.append(viewController)
        lastPushAnimated = animated
    }
}

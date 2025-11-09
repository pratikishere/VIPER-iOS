//
//  MockLoginView.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 9/11/2025.
//

import VIPER_iOS

class MockLoginView: LoginViewProtocol {
    var showLoadingCalled = false
    var hideLoadingCalled = false
    var showErrorMessageCalled = false
    var lastErrorMessage: String?
    
    func showLoading() {
        showLoadingCalled = true
    }
    
    func hideLoading() {
        hideLoadingCalled = true
    }
    
    func showErrorMessage(message: String) {
        showErrorMessageCalled = true
        lastErrorMessage = message
    }
}

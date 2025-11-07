//
//  LoginViewState.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI
import Observation

@Observable
public class LoginViewState {
    public var isLoading: Bool
    public var email: String
    public var password: String
    public var errorMessage: String
    
    public init(isLoading: Bool = false, email: String = "", password: String = "", errorMessage: String = "") {
        self.isLoading = isLoading
        self.email = email
        self.password = password
        self.errorMessage = errorMessage
    }
}

extension LoginViewState: LoginViewProtocol {
    @MainActor
    public func showLoading() {
        isLoading = true
    }
    
    @MainActor
    public func hideLoading() {
        isLoading = false
    }
    
    @MainActor
    public func showErrorMessage(message: String) {
        errorMessage = message
    }
}

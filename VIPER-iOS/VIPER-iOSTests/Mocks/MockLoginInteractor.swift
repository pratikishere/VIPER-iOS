//
//  MockLoginInteractor.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 9/11/2025.
//

@testable import VIPER_iOS

class MockLoginInteractor: LoginInteractorProtocol {
    var loginResult: LoginResult?
    var shouldDelay = false
    
    func login(email: String, password: String) async -> LoginResult {
        if shouldDelay {
            try? await Task.sleep(nanoseconds: 500_000_000) // 0.5s delay
        }
        return loginResult ?? .failure(LoginInteractor.Error.invalidCredentials)
    }
}

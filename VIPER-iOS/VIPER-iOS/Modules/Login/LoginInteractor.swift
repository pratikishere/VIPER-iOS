//
//  LoginInteractor.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import Foundation

public enum LoginResult {
    case success(User)
    case failure(Error)
}

public protocol LoginInteractorProtocol {
    func login(email: String, password: String) async -> LoginResult
}

public class LoginInteractor: LoginInteractorProtocol {
    public let dummyEmail = "test@example.com"
    public let dummyPassword = "password"
    
    public enum Error: Swift.Error {
        case invalidCredentials
        
        var description: String {
            switch self {
            case .invalidCredentials:
                return "Invalid credentials"
            }
        }
    }
    
    public init() {}
    
    deinit {
        debugPrint("LoginInteractor deinit")
    }
    
    public func login(email: String, password: String) async -> LoginResult {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        
        if email == dummyEmail && password == dummyPassword {
            let user = User(email: email, password: password)
            return .success(user)
        } else {
            return .failure(Error.invalidCredentials)
        }
    }
}

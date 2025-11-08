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
    func login(email: String, password: String, completion: @escaping (LoginResult) -> Void)
}

public class LoginInteractor: LoginInteractorProtocol {
    public let dummyEmail = "test@example.com"
    public let dummyPassword = "password"
    
    public enum Error: Swift.Error {
        case invalidCredentials
    }
    
    public init() {}
    
    public func login(email: String, password: String, completion: @escaping (LoginResult) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            if email == dummyEmail && password == dummyPassword {
                let user = User(email: email, password: password)
                completion(.success(user))
            } else {
                completion(.failure(Error.invalidCredentials))
            }
        }
    }
}

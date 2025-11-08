//
//  LoginInteractor.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import Foundation

public protocol LoginInteractorProtocol {
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void)
}

public class LoginInteractor: LoginInteractorProtocol {
    public func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if email == "test@example.com" && password == "password" {
                let user = User(email: email, password: password)
                completion(.success(user))
            } else {
                completion(.failure(NSError(domain: "LoginError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid credentials"])))
            }
        }
    }
}

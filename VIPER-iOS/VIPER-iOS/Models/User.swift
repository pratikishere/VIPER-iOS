//
//  User.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 8/11/2025.
//

import Foundation

public struct User {
    public let email: String
    public let password: String
    
    public init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}

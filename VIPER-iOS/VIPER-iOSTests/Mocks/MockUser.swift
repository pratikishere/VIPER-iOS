//
//  MockUser.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 10/11/2025.
//

@testable import VIPER_iOS

var validUser: User {
    User(email: "test@example.com", password: "password")
}

var invalidUser: User {
    User(email: "invalid@example.com", password: "invalid")
}

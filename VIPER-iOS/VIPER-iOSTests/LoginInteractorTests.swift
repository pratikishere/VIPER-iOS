//
//  LoginInteractorTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 8/11/2025.
//

import XCTest
@testable import VIPER_iOS

@MainActor
final class LoginInteractorTests: XCTestCase {

    var interactor: LoginInteractor!
    
    override func setUp() {
        super.setUp()
        interactor = LoginInteractor()
    }

    override func tearDown() {
        interactor = nil
       super.tearDown()
    }

    func test_login_validCredentialsReturnsSuccess() async {
        let result = await interactor.login(email: validUser.email, password: validUser.password)
        
        switch result {
        case .success(let user):
            XCTAssertEqual(user.email, validUser.email, "Email should match")
            XCTAssertEqual(user.password, validUser.password, "Password should match")
        case .failure:
            XCTFail("Expected success, but got failure")
        }
    }
        
    func test_login_invalidCredentialsReturnsError() async {
        let result = await interactor.login(email: invalidUser.email, password: invalidUser.password)
        
        switch result {
        case .success:
            XCTFail("Expected failure, but got success")
        case .failure(let error as LoginInteractor.Error):
            XCTAssertEqual(error, .invalidCredentials, "Should return invalidCredentials error")
        case .failure:
            XCTFail("Expected LoginInteractor.Error.invalidCredentials")
        }
    }
}

//
//  LoginInteractorTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 8/11/2025.
//

import XCTest
import VIPER_iOS

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
        let email = interactor.dummyEmail
        let password = interactor.dummyPassword
        
        let result = await interactor.login(email: email, password: password)
        
        switch result {
        case .success(let user):
            XCTAssertEqual(user.email, email, "Email should match")
            XCTAssertEqual(user.password, password, "Password should match")
        case .failure:
            XCTFail("Expected success, but got failure")
        }
    }
        
    func test_login_invalidCredentialsReturnsError() async {
        let email = "wrong@example.com"
        let password = "wrongpass"
        
        let result = await interactor.login(email: email, password: password)
        
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

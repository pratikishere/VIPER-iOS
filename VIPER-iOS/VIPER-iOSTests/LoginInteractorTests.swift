//
//  LoginInteractorTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 8/11/2025.
//

import XCTest
import VIPER_iOS

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

    func test_login_validCredentialsReturnSuccess() {
        let email = interactor.dummyEmail
        let password = interactor.dummyPassword
        
        let exp = expectation(description: "Wait for login completion")
        let expectedResult: LoginResult = .success(User(email: email, password: password))
        
        interactor.login(email: email, password: password) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.success(receivedUser), .success(expectedUser)):
                XCTAssertEqual(receivedUser.email, expectedUser.email, "Email is not matching")
                exp.fulfill()
            
            default:
                XCTFail("Expected result \(expectedResult) got \(receivedResult) instead")
            }
        }
        
        wait(for: [exp], timeout: 1.0)
    }
    
    func test_login_invalidCredentialsReturnsError() {
        let email = "invalid@example.com"
        let password = "invalid"
        
        let exp = expectation(description: "Wait for login completion")
        let expectedResult: LoginResult = .failure(LoginInteractor.Error.invalidCredentials)
        
        interactor.login(email: email, password: password) { receivedResult in
            switch (receivedResult, expectedResult) {
            case let (.failure(receivedError as LoginInteractor.Error), .failure(expectedError as LoginInteractor.Error)):
                XCTAssertEqual(receivedError, expectedError)
                exp.fulfill()
                
            default:
                XCTFail("Expected result \(expectedResult) got \(receivedResult) instead")
            }
        }
        
        wait(for: [exp], timeout: 1.0)
    }
}

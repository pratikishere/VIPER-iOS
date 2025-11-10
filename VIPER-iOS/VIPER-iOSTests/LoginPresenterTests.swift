//
//  LoginPresenterTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 7/11/2025.
//

import XCTest
import VIPER_iOS

@MainActor
final class LoginPresenterTests: XCTestCase {
    
    private var presenter: LoginPresenter!
    private var mockView: MockLoginView!
    private var interactor: MockLoginInteractor!
    private var router: MockLoginRouter!

    override func setUp() {
        super.setUp()
        interactor = MockLoginInteractor()
        router = MockLoginRouter()
        presenter = LoginPresenter(interactor: interactor, router: router)
        mockView = MockLoginView()
        
        presenter.view = mockView
    }
    
    override func tearDown() {
        mockView = nil
        interactor = nil
        presenter = nil
        router = nil
        super.tearDown()
    }
    
    func test_loginButtonTap_showsErrorWhenEmailAndPasswordFieldsAreEmpty() {
        let email = ""
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(mockView.showErrorMessageCalled)
        XCTAssertEqual(mockView.lastErrorMessage, expectedAllFieldsErrorMessage)
        XCTAssertFalse(mockView.showLoadingCalled)
    }
    
    func test_loginButtonTap_showsErrorOnWhenEmailFieldIsEmpty() {
        let email = ""
        let password = "test"
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(mockView.showErrorMessageCalled)
        XCTAssertEqual(mockView.lastErrorMessage, expectedAllFieldsErrorMessage)
    }
    
    func test_loginButtonTap_showsErrorOnWhenPasswordFieldIsEmpty() {
        let email = "test@test.com"
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(mockView.showErrorMessageCalled)
        XCTAssertEqual(mockView.lastErrorMessage, expectedAllFieldsErrorMessage)
    }
    
    func test_loginButtonTap_successWhenEmailAndPasswordFieldsAreValid() {
        let email = "test@example.com"
        let password = "password"
        
        let expectedUser = User(email: email, password: password)
        interactor.loginResult = .success(expectedUser)
        
        var receivedUser: User?
        
        let exp = expectation(description: "Wait for completion")
        router.onNavigateToHome = { user in
            receivedUser = user
            exp.fulfill()
        }
        
        presenter.didTapLogin(email: email, password: password)
        XCTAssertTrue(mockView.showLoadingCalled)
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(receivedUser?.email ?? "", expectedUser.email)
        XCTAssertTrue(mockView.hideLoadingCalled)
        XCTAssertFalse(mockView.showErrorMessageCalled)
    }
    
    // MARK: - Helpers
    
    private var expectedAllFieldsErrorMessage: String {
        presenter.allFieldsErrorMessage
    }
}

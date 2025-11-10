//
//  LoginPresenterTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 7/11/2025.
//

import XCTest
@testable import VIPER_iOS

@MainActor
final class LoginPresenterTests: XCTestCase {
    
    private var presenter: LoginPresenter!
    private var view: MockLoginView!
    private var interactor: MockLoginInteractor!
    private var router: MockLoginRouter!

    override func setUp() {
        super.setUp()
        interactor = MockLoginInteractor()
        router = MockLoginRouter()
        presenter = LoginPresenter(interactor: interactor, router: router)
        view = MockLoginView()
        presenter.view = view
    }
    
    override func tearDown() {
        view = nil
        interactor = nil
        presenter = nil
        router = nil
        super.tearDown()
    }
    
    func test_loginButtonTap_showsErrorWhenEmailAndPasswordFieldsAreEmpty() {
        let email = ""
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(view.showErrorMessageCalled)
        XCTAssertEqual(view.lastErrorMessage, expectedAllFieldsErrorMessage)
        XCTAssertFalse(view.showLoadingCalled)
    }
    
    func test_loginButtonTap_showsErrorOnWhenEmailFieldIsEmpty() {
        let email = ""
        let password = anyUserPassword()
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(view.showErrorMessageCalled)
        XCTAssertEqual(view.lastErrorMessage, expectedAllFieldsErrorMessage)
    }
    
    func test_loginButtonTap_showsErrorOnWhenPasswordFieldIsEmpty() {
        let email = anyUserEmail()
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertTrue(view.showErrorMessageCalled)
        XCTAssertEqual(view.lastErrorMessage, expectedAllFieldsErrorMessage)
    }
    
    func test_loginButtonTap_successNavigateToHome() {
        interactor.loginResult = .success(validUser)
        
        var receivedUser: User?
        
        let exp = expectation(description: "Wait for completion")
        router.onNavigateToHome = { user in
            receivedUser = user
            exp.fulfill()
        }
        
        presenter.didTapLogin(email: validUser.email, password: validUser.password)
        XCTAssertTrue(view.showLoadingCalled)
        wait(for: [exp], timeout: 1.0)
        XCTAssertEqual(receivedUser?.email ?? "", validUser.email)
        XCTAssertTrue(view.hideLoadingCalled)
        XCTAssertFalse(view.showErrorMessageCalled)
    }
    
    // MARK: - Helpers
    
    private var expectedAllFieldsErrorMessage: String {
        presenter.allFieldsErrorMessage
    }
    
    private func anyUserEmail() -> String {
        "anyemail@example.com"
    }
    
    private func anyUserPassword() -> String {
        "password"
    }
}

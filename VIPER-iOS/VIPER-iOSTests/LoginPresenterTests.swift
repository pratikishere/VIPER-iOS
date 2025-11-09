//
//  LoginPresenterTests.swift
//  VIPER-iOSTests
//
//  Created by Pratik Patel on 7/11/2025.
//

import XCTest
import VIPER_iOS

final class LoginPresenterTests: XCTestCase {
    
    var presenter: LoginPresenter!
    var mockView: MockLoginView!
    var interactor: MockLoginInteractor!

    override func setUp() {
        super.setUp()
        interactor = MockLoginInteractor()
        presenter = LoginPresenter(interactor: interactor)
        mockView = MockLoginView()
        
        presenter.view = mockView
    }
    
    override func tearDown() {
        interactor = nil
        presenter = nil
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
    
    // MARK: - Helpers
    
    private var expectedAllFieldsErrorMessage: String {
        presenter.allFieldsErrorMessage
    }
}

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
    var state: LoginViewState!

    override func setUp() {
        super.setUp()
        presenter = LoginPresenter()
        state = LoginViewState()
        presenter.view = state
    }
    
    override func tearDown() {
        presenter = nil
        state = nil
        super.tearDown()
    }
    
    func test_showsErrorOnLoginButtonTapWhenEmailAndPasswordFieldsAreEmpty() {
        let email = ""
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertEqual(state.errorMessage, "Please fill all the fields")
    }
    
    func test_showsErrorOnLoginButtonTapWhenEmailFieldsIsEmpty() {
        let email = ""
        let password = "test"
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertEqual(state.errorMessage, "Please fill all the fields")
    }
    
    func test_showsErrorOnLoginButtonTapWhenPasswordFieldsIsEmpty() {
        let email = "test@test.com"
        let password = ""
        
        presenter.didTapLogin(email: email, password: password)
        
        XCTAssertEqual(state.errorMessage, "Please fill all the fields")
    }
}

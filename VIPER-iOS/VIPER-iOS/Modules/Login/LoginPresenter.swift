//
//  LoginPresenter.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import Foundation

protocol LoginPresenterProtocol: AnyObject {
    func didTapLogin(email: String, password: String)
}

public class LoginPresenter: LoginPresenterProtocol {
    public weak var view: LoginViewProtocol?
    
    public init() {}
    
    public func didTapLogin(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            view?.showErrorMessage(message: "Please fill all the fields")
            return
        }
    }
}

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

class LoginPresenter: LoginPresenterProtocol {
    func didTapLogin(email: String, password: String) {
        
    }
}

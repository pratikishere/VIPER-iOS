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
    public var interactor: LoginInteractorProtocol
    
    public init(interactor: LoginInteractorProtocol) {
        self.interactor = interactor
    }
    
    public func didTapLogin(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            view?.showErrorMessage(message: "Please fill all the fields")
            return
        }
        
        view?.showLoading()
        
        Task { @MainActor in
            let result = await interactor.login(email: email, password: password)
            view?.hideLoading()
            switch result {
            case .success:
                loginSucceeded()
            case .failure(let error):
                loginFailed(error: error)
            }
        }
    }
    
    private func loginSucceeded() {
        
    }

    private func loginFailed(error: Error) {
        view?.showErrorMessage(message: (error as? LoginInteractor.Error)?.description ?? error.localizedDescription)
    }
}

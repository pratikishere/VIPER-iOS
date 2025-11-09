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

public final class LoginPresenter: LoginPresenterProtocol {
    public weak var view: LoginViewProtocol?
    public var interactor: LoginInteractorProtocol
    public var router: LoginRouterProtocol
    public let allFieldsErrorMessage = "Please fill all the fields"
    
    public init(interactor: LoginInteractorProtocol, router: LoginRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    public func didTapLogin(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            view?.showErrorMessage(message: allFieldsErrorMessage)
            return
        }
        
        view?.showLoading()
        
        Task { @MainActor in
            let result = await interactor.login(email: email, password: password)
            view?.hideLoading()
            switch result {
            case let .success(user):
                loginSucceeded(with: user)
            case .failure(let error):
                loginFailed(error: error)
            }
        }
    }
    
    private func loginSucceeded(with user: User) {
        router.navigateToHome(user: user)
    }

    private func loginFailed(error: Error) {
        view?.showErrorMessage(message: (error as? LoginInteractor.Error)?.description ?? error.localizedDescription)
    }
}

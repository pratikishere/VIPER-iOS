//
//  HomePresenter.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import Foundation

protocol HomePresenterProtocol {
    func viewDidLoad()
}

class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    func viewDidLoad() {
        view?.showUser(user)
    }
}

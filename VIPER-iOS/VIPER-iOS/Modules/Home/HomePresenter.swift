//
//  HomePresenter.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 9/11/2025.
//

import Foundation

public protocol HomePresenterProtocol {
    func viewDidLoad()
}

public class HomePresenter: HomePresenterProtocol {
    weak var view: HomeViewProtocol?
    public let user: User
    
    init(user: User) {
        self.user = user
    }
    
    public func viewDidLoad() {
        view?.showUser(user)
    }
}

//
//  LoginViewState.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI
import Observation

@Observable
@MainActor
class LoginViewState {
    var isLoading: Bool = false
    var email: String = ""
    var password: String = ""
}

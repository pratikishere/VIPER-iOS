//
//  LoginView.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var state: LoginViewState
    var presenter: LoginPresenterProtocol
    
    init(state: LoginViewState, presenter: LoginPresenterProtocol) {
        self._state = State(wrappedValue: state)
        self.presenter = presenter
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Credentials") {
                    TextField("Email", text: $state.email)
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    SecureField("Password", text: $state.password)
                        .textContentType(.password)
                }
                
                Section {
                    Button("Login", action: {
                        presenter.didTapLogin(email: state.email, password: state.password)
                    })
                    .disabled(state.isLoading)
                }
                
                if state.isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle("Login")
    }
}

#Preview("Default") {
    LoginView(state: LoginViewState(), presenter: LoginPresenter())
}

#Preview("Loading State") {
    let state = LoginViewState()
    state.isLoading = true
    state.email = "user@example.com"
    
    return LoginView(state: state, presenter: LoginPresenter())
}

#Preview("Filled State") {
    let state = LoginViewState()
    state.isLoading = true
    state.email = "user@example.com"
    state.password = "securepassword"
    
    return LoginView(state: state, presenter: LoginPresenter())
}

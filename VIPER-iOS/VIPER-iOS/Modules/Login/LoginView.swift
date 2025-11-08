//
//  LoginView.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

public protocol LoginViewProtocol: AnyObject {
    func showLoading()
    func hideLoading()
    func showErrorMessage(message: String)
}

struct LoginView: View {
    
    @State private var state: LoginViewState
    var presenter: LoginPresenterProtocol
    
    init(state: LoginViewState, presenter: LoginPresenterProtocol) {
        self._state = State(initialValue: state)
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
                        .id(UUID())
                }
            }
        }
        .navigationTitle("Login")
        .alert("Error", isPresented: Binding(
            get: { !state.errorMessage.isEmpty },
            set: { if !$0 { state.errorMessage = "" } }), actions: {
                Button("OK") {}
            }, message: {
                Text(state.errorMessage)
        })
        .onAppear {
            (presenter as? LoginPresenter)?.view = state
        }
    }
}

#Preview("Default") {
    LoginModuleBuilder.build()
}

#Preview("Loading State") {
    let state = LoginViewState()
    state.isLoading = true
    state.email = "user@example.com"
    
    return LoginModuleBuilder.build(with: state)
}

#Preview("Filled State") {
    let state = LoginViewState()
    state.isLoading = true
    state.email = "user@example.com"
    state.password = "securepassword"
    
    return LoginModuleBuilder.build(with: state)
}

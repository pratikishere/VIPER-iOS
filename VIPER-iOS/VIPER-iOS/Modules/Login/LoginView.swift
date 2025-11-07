//
//  LoginView.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State private var state: LoginViewState
    
    init(state: LoginViewState) {
        self._state = State(wrappedValue: state)
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
    LoginView(state: LoginViewState())
}

#Preview("Loading State") {
    let mockState = LoginViewState()
    mockState.isLoading = true
    mockState.email = "user@example.com"
    
    return LoginView(state: mockState)
}

#Preview("Filled State") {
    let mockState = LoginViewState()
    mockState.isLoading = true
    mockState.email = "user@example.com"
    mockState.password = "securepassword"
    
    return LoginView(state: mockState)
}

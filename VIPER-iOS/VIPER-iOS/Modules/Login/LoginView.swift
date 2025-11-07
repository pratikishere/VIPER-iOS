//
//  LoginView.swift
//  VIPER-iOS
//
//  Created by Pratik Patel on 7/11/2025.
//

import SwiftUI

struct LoginView: View {
    
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Credentials") {
                    TextField("Email", text: .constant(""))
                        .textContentType(.emailAddress)
                        .textInputAutocapitalization(.none)
                    
                    SecureField("Password", text: .constant(""))
                        .textContentType(.password)
                }
                
                Section {
                    Button("Login", action: {
                        
                    })
                    .disabled(isLoading)
                }
                
                if isLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(maxWidth: .infinity)
                }
            }
        }
        .navigationTitle("Login")
    }
}

#Preview("Normal state") {
    LoginView()
}

#Preview("Loading State") {
    LoginView(isLoading: true)
}

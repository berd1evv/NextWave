//
//  ContentView.swift
//  NextWave
//
//  Created by Eldiiar on 20/5/24.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    @State private var isSignUp: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Log in")
                
                TextField("email", text: $viewModel.email)
                    .textInputAutocapitalization(.never)
                
                SecureField("password", text: $viewModel.password)
                
                Button(action: {
                    viewModel.login()
                }, label: {
                    Text("Log in")
                })
                
                if !viewModel.errorMessage.isEmpty {
                    Text(viewModel.errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Spacer()
                
                Button(action: {
                    isSignUp = true
                }, label: {
                    Text("Sign up")
                })
                
            }
            .padding()
            .navigationDestination(isPresented: $isSignUp) {
                SignUpView()
            }
        }
    }
}

#Preview {
    AuthView()
}

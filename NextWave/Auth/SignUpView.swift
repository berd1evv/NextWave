//
//  SignUpView.swift
//  NextWave
//
//  Created by Eldiiar on 20/5/24.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Sign Up")
            
            TextField("Email", text: $viewModel.email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .textInputAutocapitalization(.never)
                .padding()
            
            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            SecureField("Confirm Password", text: $viewModel.confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                viewModel.register()
            }) {
                Text("Register")
                    .padding()
                    .padding(.horizontal, 16)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
        }
        .padding()
    }
}

#Preview {
    SignUpView()
}

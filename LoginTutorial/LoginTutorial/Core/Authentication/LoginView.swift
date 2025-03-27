//
//  LoginView.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var pwd = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationStack{
            VStack{
                // image
                Image("casino-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200, alignment:Alignment.center)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing: 24){
                    InputField(text: $email, 
                               title: "Email Address",
                               placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputField(text: $pwd,
                               title: "Password",
                               placeholder: "Enter your password",
                               isSecureField: true)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .padding(.horizontal, 16)
                .padding(.top)
                
                // sign in button
                Button{
                    Task{
                        try await viewModel.signIn(withEmail: email, 
                                                   pwd: pwd)
                    }
                } label: {
                    HStack{
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName:"arrow.right")
                    }
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width-32, height: 48)
                }
                .background(Color(.systemBlue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .cornerRadius(10)
                .padding(.top, 30)
                
                Spacer()
                // sign up button
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3){
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .font(.system(size:14))
                }
                

            }
        }
    }
}

// MARK: - AuthenticationFormProtocal

extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !pwd.isEmpty
        && pwd.count > 6
    }
}

#Preview {
    LoginView()
}

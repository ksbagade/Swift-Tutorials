//
//  SignUpView.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullName = ""
    @State private var email = ""
    @State private var pwd = ""
    @State private var confirmPwd = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            // image
            Image("casino-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 200, height: 200, alignment:Alignment.center)
                .padding(.vertical, 32)
            
        }
        
        // form fields
        VStack(spacing: 24){
            InputField(text: $fullName,
                       title: "Full Name",
                       placeholder: "Enter full name")
            .autocapitalization(.words)
            
            InputField(text: $email,
                       title: "Email Address",
                       placeholder: "name@example.com")
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            InputField(text: $pwd,
                       title: "Password",
                       placeholder: "Enter your password",
                       isSecureField: true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
            
            ZStack(alignment: .trailing) {
                InputField(text: $confirmPwd,
                           title: "Confirm Password",
                           placeholder: "Confirm your password",
                           isSecureField: true)
                .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                
                if(!pwd.isEmpty && !confirmPwd.isEmpty) {
                    if pwd == confirmPwd {
                        Image(systemName:"checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                    } else {
                        Image(systemName:"xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                    }
                } 
            }
        }
        .padding(.horizontal, 16)
        //.padding(.top, 5)
        
        // sign up button
        Button{
            Task{
                try await viewModel.createUser(withEmail: email,
                                               pwd: pwd,
                                               fullname: fullName)
            }
        } label: {
            HStack{
                Text("Create Account")
                    .fontWeight(.semibold)
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
        
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3){
                Text("Already have an account?")
                Text("Sign in")
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            }
            .font(.system(size:14))
        }
        .padding(.top)

    }
}

// MARK: - AuthenticationFormProtocal

extension SignUpView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !pwd.isEmpty
        && pwd.count > 6
        && confirmPwd == pwd
        && !fullName.isEmpty
        && fullName.count > 1
    }
}

#Preview {
    SignUpView()
}

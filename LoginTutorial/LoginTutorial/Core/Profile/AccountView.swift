//
//  AccountView.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List{
                Section{
                    HStack {
                        Text(User.ME_USER.initials)
                        //Text(user.initials)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        
                        VStack(alignment: .leading, spacing: 4){
                            Text(User.ME_USER.fullName)
                            //Text(user.fullName)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            Text(User.ME_USER.email)
                            //Text(user.email)
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                        
                    }
                }
                
                Section("General"){
                    HStack {
                        SettingsRowView(imageName: "gear",
                                        title: "Version",
                                        tintColor: Color(.systemGray))
                        Spacer()
                        Text("1.0.0")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Section("Account"){
                    Button {
                        viewModel.signOut()
                    } label: {
                        SettingsRowView(imageName: "arrow.left.circle.fill",
                                        title: "Sign Out",
                                        tintColor: Color(.red))
                    }

                    Button {
                        print("Sign out..")
                    } label: {
                        SettingsRowView(imageName: "xmark.circle.fill",
                                        title: "Delete Account",
                                        tintColor: Color(.red))
                    }
                }
            }
        }
    }
}

#Preview {
    AccountView()
}

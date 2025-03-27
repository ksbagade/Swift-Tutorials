//
//  ContentView.swift
//  Login Test
//
//  Created by Kaveri Bagade on 4/16/24.
//  Copyright © 2024 Kaveri Bagade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var uName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Image("login_image").resizable().scaledToFit()
                TextField(
                    "User name",
                    text: $uName
                )
                .disableAutocorrection(true)
                
                SecureField(
                    "Password",
                    text: $password
                )
                .disableAutocorrection(true)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Continue")
                    }.padding().padding()
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .navigationBarTitle("Casino Updates")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

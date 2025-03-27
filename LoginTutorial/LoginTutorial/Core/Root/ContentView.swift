//
//  ContentView.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                AccountView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}

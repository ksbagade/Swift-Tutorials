//
//  LoginTutorialApp.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import SwiftUI
import Firebase

@main
struct LoginTutorialApp: App {
    @StateObject var viewModel = AuthViewModel()
    
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}

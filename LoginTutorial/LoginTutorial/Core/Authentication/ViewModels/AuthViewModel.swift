//
//  AuthViewModel.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User? //Lets you know to go to login view or user view
    @Published var currentUser: User? //This is my local user
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task{
            await fetchUser()
        }
    }
    
    // look up what async throws does
    func signIn(withEmail email:String, pwd:String) async throws {
        print("Sign user in..")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: pwd)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email:String, pwd:String, fullname:String) async throws {
        print("Create user..")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: pwd)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        print("Sign out user..")
        do{
            try Auth.auth().signOut()
            self.userSession = nil
            self.currentUser = nil
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
    
    func fetchUserTest() {
        self.currentUser = User(id: "Z9vS9PDW9xb5PVQ0F1RfJgYcdrC3",
                                fullName: "Kaveri Account",
                                email: "test@gmail.com")
    
    }
    
    
}

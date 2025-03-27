//
//  User.swift
//  LoginTutorial
//
//  Created by Kaveri Bagade on 5/20/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id:String
    let fullName:String
    let email:String
    
    var initials: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
    var firstname: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            return components.givenName ?? fullName
        }
        return ""
    }
    
    var lastname: String{
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            return components.familyName ?? fullName
        }
        return ""
    }
}

extension User {
    static var ME_USER = User(id: NSUUID().uuidString, fullName: "Kaveri Bagade", email: "kaveribagade@example.com")
    static var TEST_USER = User(id: NSUUID().uuidString, fullName: "Kyle Nolan", email: "kylenolan@example.com")
}

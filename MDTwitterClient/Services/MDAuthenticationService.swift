//
//  MDAuthenticationService.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation

/*
 This should do some network call to authenticate the user
 For this demo, we're using local UserDefaults to store some user information
 The best practice we should use keychain to store user information
 */

enum AuthenticationStatus {
    case completed
    case error(Error)
}

// All consumers of this service will only know about this protocol,
// and never know about the concrete classes below
protocol AuthenticationService {
    //Normal login with username and password
    func login(user: String, pass: String, completion: @escaping (_ status: AuthenticationStatus) -> Void)
    
    //This is for autologin
    func attemp(completion: @escaping (_ status: AuthenticationStatus) -> Void)
    
    //Logout and clean up
    func logout()
    
    //Create new user if possible
    func create(user: String, pass: String, name: String, competion: @escaping (_ status: AuthenticationStatus) -> Void)
}


class MDAuthenticationService: AuthenticationService {
    
    func login(user: String, pass: String, completion: @escaping (AuthenticationStatus) -> Void) {
        if (user == Key.TestUser.username && pass == Key.TestUser.password) {
            completion(AuthenticationStatus.completed)
            UserDefaults.standard.set(true, forKey: Key.UserDefaults.k_App_Current_Logged)
        } else {
            let error = NSError(domain: "dcre8tive.com", code: 401, userInfo: ["Descriptions":"Unauthorized"])
            completion(AuthenticationStatus.error(error))
        }
    }
    
    func attemp(completion: @escaping (AuthenticationStatus) -> Void) {
        let loggedIn = UserDefaults.standard.bool(forKey: Key.UserDefaults.k_App_Current_Logged)
        if (loggedIn) {
            completion(AuthenticationStatus.completed)
        } else {
            let error = NSError(domain: "dcretive.com", code: 401, userInfo: ["Descriptions":"Unauthorized"])
            completion(AuthenticationStatus.error(error))
        }
    }
    
    func logout() {
        UserDefaults.standard.removeObject(forKey: Key.UserDefaults.k_App_Current_Logged)
    }
    
    func create(user: String, pass: String, name: String, competion: @escaping (AuthenticationStatus) -> Void) {
        let newUser = User()
        newUser.name = name
        newUser.userName = user
        newUser.userPassword = pass
        //Store to local user information
        UserDefaults.standard.set(newUser, forKey: Key.UserDefaults.k_App_Current_User)
        competion(AuthenticationStatus.completed)
    }
    
}


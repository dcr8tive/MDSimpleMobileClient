//
//  MDKeyConstants.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-31.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

struct Key {
    
    static let DeviceType = "iOS"
    
    struct UserDefaults {
        static let k_App_Running_FirstTime = "userRunningAppFirstTime"
        static let k_App_Current_Logged = "userIsLogged"
        static let k_App_Current_User = "currentUserRecord"
    }
    
    struct ErrorMessage{
        static let listNotFound = "No Data found"
        static let validationError = "Username or Passowrd is missing, please check again"
        static let validationUserPassword = "Username and Password are not correct, please try again"
    }
    
    struct TestUser {
        static let username = "mdle@dcre8tive.com"
        static let password = "123456"
    }
}

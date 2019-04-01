//
//  MDAuthentificationable.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-31.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import UIKit

protocol MDAuthentificationable: AnyObject {
    func loginAttempt(completion: @escaping (User?, NSError?)-> Void)
    func didLoginSuccessfull()
    func login(user: String, password: String, completion: @escaping (User?, NSError?)-> Void)
}

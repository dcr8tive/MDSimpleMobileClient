//
//  User.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var recordID = UUID().uuidString
    @objc private(set) dynamic var addDate = Date()
    @objc dynamic var userName: String? = nil
    @objc dynamic var userPassword: String? = nil
    @objc dynamic var name: String? = nil
    var tweets = List<Tweet>()
    
    
    override public static func primaryKey() -> String? {
        return "recordID"
    }
    
    override public var description: String {
        return "\(String(describing: self.name))\n"
    }
}

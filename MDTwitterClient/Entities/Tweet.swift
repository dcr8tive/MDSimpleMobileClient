//
//  Tweet.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import RealmSwift

class Tweet: Object, Encodable {
    @objc dynamic var recordID = UUID().uuidString
    @objc private(set) dynamic var addDate = Date()
    @objc dynamic var text: String? = nil
    @objc dynamic var owner: String? = nil
    
    override public static func primaryKey() -> String? {
        return "recordID"
    }
    
    func descriptions() -> String {
        let dateformatter =  DateFormatter()
        dateformatter.dateFormat = "MM/dd/yyyy h:mm"
        return "Posted on \(dateformatter.string(from: self.addDate)) by \(self.owner ?? "")"
    }
}

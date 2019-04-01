//
//  RealmHelper.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-31.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation
import RealmSwift
/*
 For the demonstration then we just create some methods to get and save data to db
 However, the best practice we should follow the good suggestion of
 Ennio Masi how to "Isolating DB layer dependency for a better app architecture: a use case with Realm"
 
 Following the url:
 http://ennioma.com/isolating-db-layer-dependency-for-a-better-app-architecture-a-use-case-with-realm/
 */
class RealmHelper {
    
    var realm: Realm?
    
    static func saveObject<T:Object>(object: T) {
        let realm = try! Realm()
        try! realm.write {
            realm.add(object)
        }
    }
    
    static func getObjects<T:Object>()->[T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self)
        return Array(realmResults)
    }
    
    static func getObjects<T:Object>(filter:String)->[T] {
        let realm = try! Realm()
        let realmResults = realm.objects(T.self).filter(filter)
        return Array(realmResults)
    }
}

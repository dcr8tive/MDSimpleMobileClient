//
//  MDNetworkRequest.swift
//  MDTwitterClient
//
//  Created by MDLE on 2019-03-31.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case noData
}

class MDNetworkRequest {
    
    static func sendRequest(data: Data, url: URL, completion: @escaping (Error?) -> Void) {
        // Network call done here
        // ...

    }
    
    
    static func getRequest(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        // Network call that returns a data blob
        // ...
    }
    
}

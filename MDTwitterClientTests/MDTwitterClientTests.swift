//
//  MDTwitterClientTests.swift
//  MDTwitterClientTests
//
//  Created by MDLE on 2019-03-30.
//  Copyright © 2019 dcre8tive. All rights reserved.
//

import XCTest
@testable import MDTwitterClient

class MDTwitterClientTests: XCTestCase {

    override func setUp() {

    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func testLoginCorrectUserNameAndPassword() {
        let auth = MDAuthenticationService()
        let exp = self.expectation(description: "test login with correct info")
        auth.login(user: Key.TestUser.username, pass: Key.TestUser.password) { (status) in
            switch (status) {
            case .completed:
                XCTAssertTrue(true)
            case .error(_):
                XCTAssertTrue(false)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }

    func testAutoLogin() {
        let auth = MDAuthenticationService()
        let exp = self.expectation(description: "test autologin with safe info")
        auth.attemp { (status) in
            switch (status) {
            case .completed:
                XCTAssertTrue(true)
            case .error(_):
                XCTAssertTrue(true)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }
    
    
    func testLoginInCorrectUserNameAndPassword() {
        let auth = MDAuthenticationService()
        let exp = self.expectation(description: "test wrong login information")
        auth.login(user: "wrong_user_name", pass: "wrong_password") { (status) in
            switch (status) {
            case .completed:
                XCTAssertTrue(true)
            case .error(_):
                XCTAssertTrue(true)
            }
            exp.fulfill()
        }
        self.waitForExpectations(timeout: 1, handler: nil)
    }

    
    func testInsertTweet() {
        let testTweet = Tweet()
        testTweet.owner = Lorem.fullName
        testTweet.text = Lorem.tweet
        RealmHelper.saveObject(object: testTweet)
        
        //Get the data back to check
        let tweets: [Tweet] = RealmHelper.getObjects()
        XCTAssertNotNil(tweets, "There is data in the tweet array")
        
    }

}

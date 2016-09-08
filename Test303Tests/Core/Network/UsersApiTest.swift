//
//  UsersApiTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
@testable import Test303

class SearchApiTest: XCTestCase {
    
    func testCreation() {
        
        let api = UsersAPI()
        XCTAssertNotNil(api.baseUrl)
        XCTAssertNotNil(api.session)
    }
    
    func testCreationWithCustomSession() {
        
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        let api = UsersAPI(session: session)
        XCTAssertEqual(session, api.session)
        XCTAssertNotNil(api.baseUrl)
    }
}

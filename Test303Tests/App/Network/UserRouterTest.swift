//
//  UserRouterTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
@testable import Test303

class UserRouterTest: XCTestCase {

    let baseUrl = "https://base.com"

    func testUserGetMethod() {
        let router = UserRouter(baseUrl: baseUrl, route: .get)
        let request = router.URLRequest
        XCTAssertEqual(request.HTTPMethod, "GET")
    }

    func testUserGetUrlAndParams() {

        let router = UserRouter(baseUrl: baseUrl, route: .get)
        let request = router.URLRequest
        if let url = request.URL {
            XCTAssertTrue(url.absoluteString.containsString("rows=100"))
            XCTAssertTrue(url.absoluteString.containsString("city=%7Bcity%7D"))
            XCTAssertTrue(url.absoluteString.containsString("lname=%7BlastName%7D"))
            XCTAssertTrue(url.absoluteString.containsString("fname=%7BfirstName%7D"))
        } else {
            XCTFail("Image Search Route does not have a valid URL")
        }
    }
}

//
//  UserEntityTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
@testable import Test303

class ImageEntityTest: XCTestCase {

    typealias JsonObject = [String: AnyObject]

    func entityJsonObject() -> JsonObject {

        let jsonPath = NSBundle(forClass: self.dynamicType).pathForResource("test-users", ofType: "json")!
        let jsonData = NSData(contentsOfFile: jsonPath)!
        let jsonArray = try! NSJSONSerialization.JSONObjectWithData(jsonData,
                                                                    options: NSJSONReadingOptions()) as! [JsonObject]

        guard let entity = jsonArray.first else {
            return [:]
        }

        return entity
    }

    func testParseFullJson() {

        let jsonObject = entityJsonObject()
        let entity = UserEntity(json: jsonObject)
        XCTAssertNotNil(entity)
        XCTAssertTrue(entity.firstName != "")
        XCTAssertTrue(entity.lastName != "")
        XCTAssertTrue(entity.city != "")
    }

    func testParseEmptyJson() {

        let entity = UserEntity(json: [:])
        XCTAssertNotNil(entity)
        XCTAssertNotNil(entity.firstName)
        XCTAssertNotNil(entity.lastName)
        XCTAssertNotNil(entity.city)
    }
}

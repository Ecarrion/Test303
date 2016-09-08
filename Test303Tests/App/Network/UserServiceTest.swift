//
//  UserServiceTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
import Mockingjay
import RxSwift
import RxBlocking
@testable import Test303

class UserServiceTest: XCTestCase {

    var disposeBag: DisposeBag!
    override func setUp() {
        super.setUp()
        disposeBag = DisposeBag()
    }

    func stubUsersWithFileName(name: String) {
        let successPath = NSBundle(forClass: self.dynamicType).pathForResource(name, ofType: "json")!
        let successData = NSData(contentsOfFile: successPath)!
        stub(everything, builder: jsonData(successData))
    }

    func testImageServiceSuccess() {

        self.stubUsersWithFileName("test-users")
        let service = UserService()

        let users = try! service.getUsers().toBlocking().first()!
        XCTAssertTrue(!users.isEmpty)
    }
}

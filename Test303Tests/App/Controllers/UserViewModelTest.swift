//
//  UserViewModelTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/9/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
@testable import Test303

class UserViewModelTest: XCTestCase {

    func testFullName() {
        let user = User(firstName: "Dev", lastName: "One", city: "Denver")
        let viewModel = UserViewModel(user: user)
        XCTAssertEqual(viewModel.fullName, "Dev One")
    }

    func testCity() {
        let user = User(firstName: "Dev", lastName: "One", city: "Denver")
        let viewModel = UserViewModel(user: user)
        XCTAssertEqual(viewModel.city, "Denver")
    }
}

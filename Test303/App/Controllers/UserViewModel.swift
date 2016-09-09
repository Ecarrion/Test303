//
//  UserViewModel.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/9/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation

struct UserViewModel {

    let user: User
    init (user: User) {
        self.user = user
    }

    var fullName: String {
        get {
            return "\(user.firstName) \(user.lastName)"
        }
    }
    
    var city: String {
        get {
            return user.city
        }
    }
}

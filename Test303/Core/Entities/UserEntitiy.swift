//
//  UserEntitiy.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import SwiftyJSON

struct UserEntity {
    
    var firstName: String
    var lastName: String
    var city: String
    
    init(json: [String: AnyObject]) {
        
        let json = JSON(json)
        firstName = json["fname"].stringValue
        lastName = json["lname"].stringValue
        city = json["city"].stringValue
    }
}
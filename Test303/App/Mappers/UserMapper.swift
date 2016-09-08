//
//  UserMapper.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation

class UserMapper: Mapper {
    
    static func modelFromEntity(entity: UserEntity) -> User {
        
        let user = User(firstName: entity.firstName, lastName: entity.lastName, city: entity.city)
        return user
    }
    
    static func entityFromModel(model: User) -> UserEntity {
        
        var userEntity = UserEntity(json: [:])
        userEntity.firstName = model.firstName
        userEntity.lastName = model.lastName
        userEntity.city = model.city
        return userEntity
    }
}

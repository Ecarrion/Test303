//
//  UserMapperTest.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import XCTest
@testable import Test303

class UserMapperTest: XCTestCase {
    
    func createEntityWithID(firstName: String) -> UserEntity {
        
        var entity = UserEntity(json:[:])
        entity.firstName = firstName
        entity.lastName = "Doe"
        entity.city = "Denver"
        
        return entity
    }
    
    func equals(entity: UserEntity, model: User) -> Bool {
        
        guard
            entity.firstName == model.firstName &&
                entity.lastName == model.lastName &&
                entity.city == model.city
            else {
                return false
        }
        
        return true
    }
    
    func testModelFromEntity() {
        
        let entity = createEntityWithID("John")
        let model = UserMapper.modelFromEntity(entity)
        XCTAssertTrue(equals(entity, model: model))
    }
    
    func testEntityFromModel() {
        
        let entity = createEntityWithID("Maria")
        let model = UserMapper.modelFromEntity(entity)
        let sameEntity = UserMapper.entityFromModel(model)
        XCTAssertTrue(equals(sameEntity, model: model))
    }
}

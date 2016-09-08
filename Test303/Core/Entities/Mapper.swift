//
//  Mapper.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation

protocol Mapper {

    associatedtype Model
    associatedtype Entity

    static func modelFromEntity(entity: Entity) -> Model
    static func entityFromModel(model: Model) -> Entity
}

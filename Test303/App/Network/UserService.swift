//
//  UserService.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import RxSwift

protocol UserNetworkService {
    func getUsers() -> Observable<[User]>
}

enum UserNetworkError: ErrorType, Equatable {
    case unknown
    case parse
}

class UserService: UserNetworkService {

    let api: HTTPApi
    required init(api: HTTPApi = UsersAPI()) {
        self.api = api
    }

    func getUsers() -> Observable<[User]> {

        let route = UserRouter(baseUrl: api.baseUrl, route: .get)
        return api.request(route).map(mapResponse)
    }
}

//MARK: Map Entities
extension UserService {

    func mapResponse(response: AnyObject) throws ->[User] {

        guard let results = response as? [[String : AnyObject]] else {
                throw UserNetworkError.parse
        }

        return results.map(UserEntity.init).map(UserMapper.modelFromEntity)
    }
}

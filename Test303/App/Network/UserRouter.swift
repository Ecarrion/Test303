//
//  UserRouter.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import Alamofire

struct UserRouter: URLRequestConvertible {
    
    enum Route {
        case get
    }
    
    let baseUrl: String
    let route: Route
    init(baseUrl: String, route: Route) {
        self.baseUrl = baseUrl
        self.route = route
    }
    
    var URLRequest: NSMutableURLRequest {
        
        var request = NSMutableURLRequest(URL: url)
        request.HTTPMethod = method.rawValue
        (request, _) = ParameterEncoding.URL.encode(request, parameters: params)
        return request
    }
}

// MARK: Method
extension UserRouter {
    
    var method: Alamofire.Method {
        
        switch self.route {
        case .get:
            return .GET
        }
    }
}

// MARK: Params
extension UserRouter {
    
    var params: [String : AnyObject]? {
        
        switch self.route {
        case .get:
            return ["rows" : 100,
                    "fname" : "{firstName}",
                    "lname" : "{lastName}",
                    "city" : "{city}",
                    "pretty" : true]
        }
    }
}

// MARK: URL
extension UserRouter {
    
    var url: NSURL {
        return NSURL(string: self.baseUrl) ?? NSURL()
    }
}

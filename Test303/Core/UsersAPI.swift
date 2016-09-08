//
//  UsersAPI.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

class UsersAPI: NSObject, HTTPApi {

    let session: NSURLSession
    let manager: Manager
    let baseUrl: String

    required init(session: NSURLSession = NSURLSession.sharedSession()) {

        self.session = session
        self.baseUrl = "http://www.filltext.com/"
        let delegate = Manager.SessionDelegate()
        manager = Manager(session: session, delegate: delegate) ?? Manager.sharedInstance
    }

    func request(urlRequest: URLRequestConvertible) -> Observable<AnyObject> {

        return coldSignal({ [weak self] observer in

            guard let `self` = self else { return }
            self.manager.request(urlRequest)
                .responseJSON { response in
                    self.resolve(observer, value: response.result.value, error: response.result.error)
            }
        })
    }
}

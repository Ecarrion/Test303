//
//  API.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

enum HTTPApiError: ErrorType {
    case undefined
}

protocol HTTPApi {

    var session: NSURLSession { get }
    var manager: Manager { get }
    var baseUrl: String { get }
    init(session: NSURLSession)
    func request(urlRequest: URLRequestConvertible) -> Observable<AnyObject>
}

//MARK: RXSwift
extension HTTPApi {

    func coldSignal<T>(closure: AnyObserver<T> -> Void) -> Observable<T> {
        return Observable.create({ observer -> Disposable in
            closure(observer)
            return NopDisposable.instance
        })
    }

    func resolve<T>(observer: AnyObserver<T>, value: T?, error: ErrorType?) {

        switch (value, error) {

        case (.Some(let value), _): // Value, (Any)
            observer.on(.Next(value))
            observer.on(.Completed)

        case (.None, .Some(let error)): // No Value, Error
            observer.on(.Error(error))

        case (.None, .None):
            observer.on(.Error(HTTPApiError.undefined))
        }
    }
}

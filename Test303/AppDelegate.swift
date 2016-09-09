//
//  AppDelegate.swift
//  Test303
//
//  Created by Ernesto Carrion on 9/8/16.
//  Copyright © 2016 ecarrion. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions
        launchOptions: [NSObject: AnyObject]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.rootViewController = MainViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}

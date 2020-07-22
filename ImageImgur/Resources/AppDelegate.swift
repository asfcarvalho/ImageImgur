//
//  AppDelegate.swift
//  ImageImgur
//
//  Created by Anderson F Carvalho on 20/07/20.
//  Copyright © 2020 asfcarvalho. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ImageListVC()
        window?.makeKeyAndVisible()
        
        return true
    }
}


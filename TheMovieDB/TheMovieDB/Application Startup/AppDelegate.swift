//
//  AppDelegate.swift
//  TheMovieDB
//
//  Created by Ashish Personal on 07/10/20.
//  Copyright © 2020 Ashish Badak. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var applicationCoordinator: ApplicationCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let applicationCoordinator = ApplicationCoordinator(window: window)
        applicationCoordinator.start()
        
        self.window = window
        self.applicationCoordinator = applicationCoordinator
        
        return true
    }
}


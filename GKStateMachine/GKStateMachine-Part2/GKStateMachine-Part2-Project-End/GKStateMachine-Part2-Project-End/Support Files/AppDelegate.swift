//
//  AppDelegate.swift
//  GKStateMachine-Part2-Project-Start
//
//  Created by Jordan Huffman on 2/13/20.
//  Copyright © 2020 Jordan Huffman. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow()
        window?.rootViewController = GameViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}


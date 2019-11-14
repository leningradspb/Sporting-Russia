//
//  AppDelegate.swift
//  Sporting Russia
//
//  Created by Eduard Sinyakov on 10/9/19.
//  Copyright © 2019 Eduard Siniakov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UINavigationBar.appearance().tintColor = .white
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0.1605580747, blue: 0.4240185022, alpha: 1)
		
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0, green: 0.1605580747, blue: 0.4240185022, alpha: 1)
		UITabBar.appearance().tintColor = #colorLiteral(red: 0.8195309043, green: 0, blue: 0.1600256264, alpha: 1)
		UITabBar.appearance().unselectedItemTintColor = .white
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
            //else {
//            // Fallback on earlier versions
//        }
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}

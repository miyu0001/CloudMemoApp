//
//  AppDelegate.swift
//  CloudMemoApp
//
//  Created by 佐藤未悠 on 2021/07/18.
//

import UIKit
import NCMB

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let applicationKey = "d396a035363954f488ab5f6cbb0168fb1e8587f30b8c729fa54cb7d3f8367d2a"
        let clientKey = "368d1e1f3c44ae71cff83c4e2639986b615caa984996bec2571f3a7a54c13629"
        NCMB.setApplicationKey(applicationKey, clientKey: clientKey)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


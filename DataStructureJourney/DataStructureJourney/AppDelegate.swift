//
//  AppDelegate.swift
//  DataStructureJourney
//
//  Created by Son Le on 23/07/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let vc = DataRaceMock()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }
}

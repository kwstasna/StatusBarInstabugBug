//
//  AppDelegate.swift
//  StatusBarTest
//
//  Created by Konstantinos Natsios on 29/7/22.
//

import UIKit
import Instabug

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        let betaToken = "<<YOUR TOKEN HERE>>"
        Instabug.start(
            withToken: betaToken,
            invocationEvents: [.floatingButton]
        )
        Instabug.reproStepsMode = .enable
        
        return true
    }
}


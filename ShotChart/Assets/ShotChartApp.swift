//
//  ShotChartApp.swift
//  ShotChart
//
//  Created by Matteo Dall'Olmo on 8/13/21.
//

import SwiftUI
import Firebase

@main
struct ShotChartApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            StartView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
    
    static var orientationLock =
    UIInterfaceOrientationMask.portrait

    func application(_ application: UIApplication,
    supportedInterfaceOrientationsFor window:
    UIWindow?) -> UIInterfaceOrientationMask {
    return AppDelegate.orientationLock
    }
}

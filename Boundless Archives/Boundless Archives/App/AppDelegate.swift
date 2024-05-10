//
//  AppDelegate.swift
//  Boundless 
//
//  Created by Bassil Taylor on 5/6/24.
//


    import SwiftUI
    import FirebaseCore

    class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
    }



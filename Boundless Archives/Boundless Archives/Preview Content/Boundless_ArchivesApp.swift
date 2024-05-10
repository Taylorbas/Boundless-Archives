//
//  Boundless_ArchivesApp.swift
//  Boundless Archives
//
//  Created by Bassil Taylor on 4/3/24.
//

import SwiftUI

@main
struct Boundless_ArchivesApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            WelcomeView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // Your app configuration code
        return true
    }
    
    // Other AppDelegate methods...
}

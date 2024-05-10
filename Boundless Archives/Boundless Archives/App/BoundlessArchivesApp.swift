//
//  SettingsViewController.swift
//  Boundless 
//
//  Created by Bassil Taylor on 4/18/24.
//

import SwiftUI
import Firebase

@main
struct BoundlessArchivesApp: App {
      // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

      var body: some Scene {
        WindowGroup {
          NavigationView {
            WelcomeView()
          }
        }
      }
    }

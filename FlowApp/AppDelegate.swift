//
//  Appdelegate.swift
//  FlowApp
//
//  Created by Horacio Guzman on 9/08/20.
//

import Foundation
import UIKit
import Intents

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        INPreferences.requestSiriAuthorization { (status) in
            
        }
        
        return true
    }
}

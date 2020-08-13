//
//  AppDelegate.swift
//  FlowApp
//
//  Created by Horacio Guzman on 12/08/20.
//

import Foundation
import UIKit
import Intents

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        INPreferences.requestSiriAuthorization { [weak self] (status) in
            self?.donateIntent()
        }
        
        return true
    }
    
    func donateIntent() {
        let intent = AddIncommingIntent()
        intent.ammount = INCurrencyAmount(amount: 0.0, currencyCode: "USD")
        intent.incommingDescription = "incommingDescription"
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.donate { (error) in
            print("Error donate \(error?.localizedDescription)")
            print(error)
        }
    }
}

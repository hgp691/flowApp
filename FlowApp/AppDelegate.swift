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
        
        INPreferences.requestSiriAuthorization { [weak self] (status) in
            if status == .authorized {
                self?.donateInteraction()
            }
        }
        
        return true
    }
    
    func donateInteraction() {
        let intent = AddIncommingIntent()
        intent.suggestedInvocationPhrase = "Add Incomming"
        intent.incommingValue = INCurrencyAmount(amount: 0.0, currencyCode: "USD")
        intent.IncommingDescription = "Incomming Description"
        intent.isIncomming = true
        let interaction = INInteraction(intent: intent, response: nil)
        
        interaction.donate { (error) in
            print("Interaction donate error: \(error?.localizedDescription ?? "Nil")")
        }
    }
}

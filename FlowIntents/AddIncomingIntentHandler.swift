//
//  IncomingIntentHandler.swift
//  FlowIntents
//
//  Created by Horacio Guzman on 12/08/20.
//

import Foundation
import Intents

class AddIncomingIntentHandler: NSObject, AddIncommingIntentHandling {
    
    
    func handle(intent: AddIncommingIntent, completion: @escaping (AddIncommingIntentResponse) -> Void) {
        
        print("Intent Complete ammount \(intent.ammount)")
        print("Intent Complete description \(intent.incommingDescription)")
        
        guard let ammount = intent.ammount, let description = intent.incommingDescription else {
            completion(AddIncommingIntentResponse(code: .failure, userActivity: nil))
            return
        }
        
        
        CoreDataManager.sharedManager.createIncomming(Double(truncating: ammount.amount ?? -1),
                                                      true,
                                                      description)
        
        completion(AddIncommingIntentResponse(code: .success, userActivity: nil))
    }
    
    func resolveAmmount(for intent: AddIncommingIntent, with completion: @escaping (AddIncommingAmmountResolutionResult) -> Void) {
        let ammount = intent.ammount ?? INCurrencyAmount(amount: 0.0, currencyCode: "USD")
        print("Intent resolve ammount \(ammount)")
        completion(AddIncommingAmmountResolutionResult.success(with: ammount))
    }
    
    func resolveIncommingDescription(for intent: AddIncommingIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        
        let description = intent.incommingDescription ?? "NOPE"
        print("Intent resolve description \(description)")
        completion(INStringResolutionResult.success(with: description))
    }
}

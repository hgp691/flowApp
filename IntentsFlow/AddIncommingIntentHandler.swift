//
//  AddIncommingIntentHandler.swift
//  IntentsFlow
//
//  Created by Horacio Guzman on 10/08/20.
//

import Foundation
import Intents

class AddIncommingIntentHandler: NSObject, AddIncommingIntentHandling {
   
    func handle(intent: AddIncommingIntent, completion: @escaping (AddIncommingIntentResponse) -> Void) {
        print("Intent Value: \(intent.incommingValue)")
        print("Intent description \(intent.IncommingDescription ?? "NOPE")")
        print("Intent isIncomming \(intent.isIncomming)")
        completion(AddIncommingIntentResponse(code: .success, userActivity: nil))
    }
    
    func resolveIncommingValue(for intent: AddIncommingIntent, with completion: @escaping (AddIncommingIncommingValueResolutionResult) -> Void) {
        let ammount = intent.incommingValue ?? INCurrencyAmount(amount: 0.0, currencyCode: "USD")
        print("Intent Value: \(ammount)")
        completion(AddIncommingIncommingValueResolutionResult.success(with: ammount))
    }
    
    func resolveIncommingDescription(for intent: AddIncommingIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        let description = intent.IncommingDescription ?? "NOPE"
        print("Intent description \(description)")
        completion(INStringResolutionResult.success(with: description))
    }
    
    func resolveIsIncomming(for intent: AddIncommingIntent, with completion: @escaping (INBooleanResolutionResult) -> Void) {
        
        let value: Bool = intent.isIncomming == 0 ? false : true
        
        completion(INBooleanResolutionResult.success(with: value))
    }
    
}

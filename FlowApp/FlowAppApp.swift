//
//  FlowAppApp.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

@main
struct FlowAppApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            IncommingMainView()
        }
    }
}

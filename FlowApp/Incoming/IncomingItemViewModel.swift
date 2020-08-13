//
//  IncommingItemViewModel.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import Foundation
import SwiftUI

protocol IncomingItemViewModelProtocol {
    
    var itemDescription: String { get }
    var value: String { get }
    var color: Color { get }
}

class IncomingItemViewModel: IncomingItemViewModelProtocol {
    
    var incoming: Incoming
    
    var itemDescription: String {
        incoming.itemDescription ?? ""
    }
    
    var value: String {
        "\(incoming.value)"
    }
    
    var color: Color {
        if incoming.isIncoming {
            return Color.blue
        } else {
            return Color.green
        }
    }
    
    init(incoming: Incoming) {
        self.incoming = incoming
    }
}

class MockIncommingViewModel: IncomingItemViewModelProtocol {
    
    var itemDescription: String {
        "Incomming mock"
    }
    
    var value: String {
        "50"
    }
    
    var color: Color {
        return Color.blue
        
    }
    
    init() { }
}

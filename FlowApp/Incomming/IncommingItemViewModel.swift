//
//  IncommingItemViewModel.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import Foundation
import SwiftUI

protocol IncommingItemViewModelProtocol {
    
    var itemDescription: String { get }
    var value: String { get }
    var color: Color { get }
}

class IncommingItemViewModel: IncommingItemViewModelProtocol {
    
    var incomming: Incomming
    
    var itemDescription: String {
        incomming.itemDescription ?? ""
    }
    
    var value: String {
        "\(incomming.value)"
    }
    
    var color: Color {
        if incomming.isIncomming {
            return Color.blue
        } else {
            return Color.green
        }
    }
    
    init(incomming: Incomming) {
        self.incomming = incomming
    }
}

class MockIncommingViewModel: IncommingItemViewModelProtocol {
    
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

//
//  NewIncommingForm.swift
//  FlowApp
//
//  Created by Horacio Guzman on 9/08/20.
//

import SwiftUI

struct NewIncomingForm: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State var value: String = ""
    @State var isIncoming = false
    @State var incomingDescription = ""
    
    var body: some View {
        Form {
            TextField("Value", text: $value).keyboardType(.numberPad)
            Toggle(isOn: $isIncoming, label: {
                Text("Is Incoming")
            })
            TextField("Incoming Description", text: $incomingDescription)
            Button("Save") {
                saveIncomming()
            }
        }
    }
}

extension NewIncomingForm {
    
    private func saveIncomming() {
        guard let value = Double(value) else {
            return
        }
        CoreDataManager.sharedManager.createIncoming(value,
                                                      isIncoming,
                                                      incomingDescription)
        dismissView()
    }
    private func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewIncommingForm_Previews: PreviewProvider {
    static var previews: some View {
        NewIncomingForm()
    }
}

//
//  NewIncommingForm.swift
//  FlowApp
//
//  Created by Horacio Guzman on 9/08/20.
//

import SwiftUI

struct NewIncommingForm: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    @State var value: String = ""
    @State var isIncomming = false
    @State var incommingDescription = ""
    
    var body: some View {
        Form {
            TextField("Value", text: $value).keyboardType(.numberPad)
            Toggle(isOn: $isIncomming, label: {
                Text("Is Incomming")
            })
            TextField("Incomming Description", text: $incommingDescription)
            Button("Save") {
                saveIncomming()
            }
        }
    }
}

extension NewIncommingForm {
    
    private func saveIncomming() {
        guard let value = Double(value) else {
            return
        }
        CoreDataManager.sharedManager.createIncomming(value,
                                                      isIncomming,
                                                      incommingDescription)
        dismissView()
    }
    private func dismissView() {
        self.presentationMode.wrappedValue.dismiss()
    }
}

struct NewIncommingForm_Previews: PreviewProvider {
    static var previews: some View {
        NewIncommingForm()
    }
}

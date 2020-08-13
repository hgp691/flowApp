//
//  IncommingMainView.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

struct IncomingMainView: View {
    
    @State var showingNewIncommingForm = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            IncomingListView()
                .environment(\.managedObjectContext, CoreDataManager.sharedManager.persistanceContainer.viewContext)
                .navigationBarTitle("Incomings")
                .foregroundColor(.blue)
                .navigationBarItems(trailing:
                                        Button(action: {
                                            self.showingNewIncommingForm.toggle()
                                        }) {
                                            Image(systemName: "plus.circle.fill")
                                                .imageScale(.large)
                                                .foregroundColor(.blue)
                                        }.sheet(isPresented: $showingNewIncommingForm,
                                                content: {
                                            NewIncomingForm()
                                        })
                )
        }
    }
}

struct IncommingMainView_Previews: PreviewProvider {
    static var previews: some View {
        IncomingMainView()
    }
}

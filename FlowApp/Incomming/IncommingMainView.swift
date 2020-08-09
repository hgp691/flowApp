//
//  IncommingMainView.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

struct IncommingMainView: View {
    
    @State var showingNewIncommingForm = false
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            IncommingListView()
                .environment(\.managedObjectContext, CoreDataManager.sharedManager.persistanceContainer.viewContext)
                .navigationBarTitle("Incommings")
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
                                            NewIncommingForm()
                                        })
                )
        }
    }
}

struct IncommingMainView_Previews: PreviewProvider {
    static var previews: some View {
        IncommingMainView()
    }
}

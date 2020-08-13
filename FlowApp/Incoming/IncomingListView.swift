//
//  IncommingListView.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

struct IncomingListView: View {
    
    @FetchRequest(fetchRequest: CoreDataManager.getAll()) var incomings: FetchedResults<Incoming>
    
    var body: some View {
        List {
            ForEach(incomings, id: \.date) { incoming in
                IncomingItemView(viewModel: IncomingItemViewModel(incoming: incoming))
            }
        }
    }
}

struct IncommingListView_Previews: PreviewProvider {
    static var previews: some View {
        IncomingListView()
    }
}

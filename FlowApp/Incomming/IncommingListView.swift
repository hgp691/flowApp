//
//  IncommingListView.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

struct IncommingListView: View {
    
    @FetchRequest(fetchRequest: CoreDataManager.getAll()) var incommings: FetchedResults<Incomming>
    
    var body: some View {
        List {
            ForEach(incommings, id: \.date) { incomming in
                IncommingItemView(viewModel: IncommingItemViewModel(incomming: incomming))
            }
        }
    }
}

struct IncommingListView_Previews: PreviewProvider {
    static var previews: some View {
        IncommingListView()
    }
}

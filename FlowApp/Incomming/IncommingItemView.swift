//
//  IncommingItemView.swift
//  FlowApp
//
//  Created by Horacio Guzman on 8/08/20.
//

import SwiftUI

struct IncommingItemView: View {
    
    let viewModel: IncommingItemViewModelProtocol
    
    var body: some View {
        VStack {
            Text(viewModel.itemDescription)
                .foregroundColor(.white)
            HStack {
                Spacer()
                Text(viewModel.value)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }.listRowBackground(
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(viewModel.color)
        )
        .padding()
    }
}

struct IncommingItemView_Previews: PreviewProvider {
    static var previews: some View {
        IncommingItemView(viewModel: MockIncommingViewModel())
    }
}

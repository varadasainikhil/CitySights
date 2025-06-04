//
//  ListView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/4/25.
//

import SwiftUI

struct ListView: View {
    @Environment(BusinessViewModel.self) var viewModel
    
    var body: some View {
        List {
            ForEach(viewModel.businesses) { b in
                VStack (spacing: 20) {
                    HStack (spacing: 0) {
                        Image("list-placeholder-image")
                            .padding(.trailing, 16)
                        VStack (alignment: .leading) {
                            Text(b.name)
                                .font(Font.system(size: 15))
                                .bold()
                            
                            Text(DistanceHelper.distanceAwayText(meters: b.distance ?? 0))
                        }
                        Spacer()
                        Image(RatingHelper.roundRatings(unroundedRating: b.rating ?? 0))
                    }
                    Divider()
                }
                .onTapGesture {
                    viewModel.selectedBusiness = b
                }
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListView()
        .environment(BusinessViewModel())
}

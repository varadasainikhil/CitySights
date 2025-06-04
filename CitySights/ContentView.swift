//
//  ContentView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(BusinessViewModel.self) var viewModel
    var body: some View {
        @Bindable var viewModel = viewModel
           VStack {
               HStack {
                   TextField("What are you looking for?", text: $viewModel.query)
                   
                   Button {
                       // TODO: Implement query
                   } label: {
                       Text("Go")
                           .padding(.horizontal)
                           .padding(.vertical, 10)
                           .background(.blue)
                           .foregroundColor(.white)
                           .cornerRadius(10)
                   }
               }
               
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
           .sheet(item: $viewModel.selectedBusiness) { item in
               BusinessDetailView()
           }
           .onAppear{
               viewModel.getBusinesses()
           }
       }
   }

   #Preview {
       ContentView()
   }

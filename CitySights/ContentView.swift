//
//  ContentView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    let service = DataService()
    @State private var businesses = [Business]()
    @State private var query : String = ""
    @State var selectedBusiness : Business?

    var body: some View {
           VStack {
               HStack {
                   TextField("What are you looking for?", text: $query)
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
                   ForEach(businesses) { b in
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
                           selectedBusiness = b
                       }
                   }
                   .listRowSeparator(.hidden)
               }
               .listStyle(.plain)
           }
           .task {
               businesses = await service.businessSearch()
           }
           .sheet(item: $selectedBusiness) { item in
               BusinessDetailView(business : item)
           }
       }
   }

   #Preview {
       ContentView()
   }

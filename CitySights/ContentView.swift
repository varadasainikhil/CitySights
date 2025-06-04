//
//  ContentView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(BusinessViewModel.self) var viewModel
    @State var selectedTab = 0
    
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
               // Show Picker
               Picker("", selection: $selectedTab) {
                   Text("List")
                       .tag(0)
                   
                   Text("Map")
                       .tag(1)
               }
               .pickerStyle(.segmented)
               
               // Show map or list
               
               if selectedTab == 1 {
                   MapView()
               }
               else{
                   ListView()
               }
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
           .environment(BusinessViewModel())
   }

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
    @State var query : String = ""
    @FocusState var isTextFieldFocused : Bool
    @State var dealsOn = false
    @State var popularOn = false
    @State var categorySelection = "restaurants"
    
    var body: some View {
        @Bindable var viewModel = viewModel
        VStack {
            HStack {
                TextField("What are you looking for?", text: $query)
                    .textFieldStyle(.roundedBorder)
                    .focused($isTextFieldFocused)
                
                Button {
                    withAnimation {
                        isTextFieldFocused = false
                    }
                    viewModel.getBusinesses(query: query, options: getOptionsString(), category: categorySelection)
                } label: {
                    Text("Go")
                        .padding(.horizontal)
                        .frame(height: 34)
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(7)
                }
            }
            .padding(.horizontal)
            
            // Query Options, Show if text box is focused
            if isTextFieldFocused {
                VStack {
                    Toggle("Popular", isOn: $popularOn)
                    Toggle("Deals", isOn: $dealsOn)
                    
                    HStack {
                        Text("Category")
                        
                        Spacer()
                        
                        Picker("Category", selection: $categorySelection) {
                            Text("Restaurants")
                                .tag("restaurants")
                            Text("Arts")
                                .tag("arts")
                        }
                    }
                }
                .padding(.horizontal)
                .transition(.move(edge: .top).combined(with: .opacity))
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
                    .onTapGesture {
                        isTextFieldFocused = false
                    }
                        
                    
            } else {
                ListView()
                    .onTapGesture {
                        isTextFieldFocused = false
                    }
            }
        }
        .sheet(item: $viewModel.selectedBusiness) { item in
            BusinessDetailView()
        }
        .onAppear {
            viewModel.getBusinesses(query: nil, options: nil, category: nil)
        }
    }
    
    func getOptionsString() -> String {
        var optionsArray = [String]()
        if popularOn {
            optionsArray.append("hot_and_new")
        }
        if dealsOn {
            optionsArray.append("deals")
        }
        return optionsArray.joined(separator: ",")
    }
}

#Preview {
    ContentView()
        .environment(BusinessViewModel())
}

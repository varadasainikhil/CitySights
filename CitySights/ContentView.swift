//
//  ContentView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import SwiftUI

struct ContentView: View {
    let service = DataService()
    var body: some View {
        Button("Call the API"){
            Task{
                await service.businessSearch()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

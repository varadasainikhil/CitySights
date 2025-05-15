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
    var body: some View {
        VStack{
            Button("Call the API"){
                Task{
                    businesses = await service.businessSearch()
                }
            }
            .padding()
            
            List(businesses){business in
                Text(business.name)
                
            }
        }
    }
}

#Preview {
    ContentView()
}

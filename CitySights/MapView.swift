//
//  MapView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/4/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Environment(BusinessViewModel.self) var viewModel
    @State var selectedBusinessId : String?
    var body: some View {
        Map(selection: $selectedBusinessId) {
            ForEach(viewModel.businesses, id: \.id){business in
                Marker(business.name, coordinate: CLLocationCoordinate2D(latitude: business.coordinates.latitude, longitude: business.coordinates.longitude))
                    .tag(business.id!)
            }
            
        }
        .onChange(of: selectedBusinessId) { oldValue, newValue in
            // Find the business which matches the id
            let business = viewModel.businesses.first { business in
                business.id == selectedBusinessId
            }
            
            //If the business is found, set it as the selected one
            if business != nil{
                viewModel.selectedBusiness = business
            }
        }
    }
}

#Preview {
    MapView()
}

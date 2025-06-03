//
//  BusinessDetailView.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/3/25.
//

import SwiftUI

struct BusinessDetailView: View {
    
    var business : Business?
    var body: some View {
        Text(business?.name ?? "")
    }
}

#Preview {
    BusinessDetailView()
}

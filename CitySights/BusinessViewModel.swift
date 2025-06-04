//
//  BusinessViewModel.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/4/25.
//

import Foundation
import SwiftUI

@Observable
class BusinessViewModel{
    var service = DataService()
    var businesses = [Business]()
    var query : String = ""
    var selectedBusiness : Business?
    
    func getBusinesses() {
        Task{
            businesses = await service.businessSearch()
        }
    }
}

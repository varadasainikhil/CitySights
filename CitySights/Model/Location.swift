//
//  Location.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/14/25.
//

import Foundation

struct Location : Codable{
    
    enum CodingKeys : String, CodingKey {
        case address1
        case address2
        case address3
        case city
        case zipCode = "zip_code"
        case country
        case state
        case displayAddress = "display_address"
    }
    
    
    var address1 : String?
    var address2 : String?
    var address3 : String?
    var city : String?
    var zipCode : String?
    var country : String?
    var state : String?
    var displayAddress : [String] = [String]()
}

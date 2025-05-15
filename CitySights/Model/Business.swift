//
//  Businesses.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/14/25.
//

import Foundation

struct Business : Codable, Identifiable{
    
    enum CodingKeys : String, CodingKey{
        case isClosed = "is_closed"
        case imageURL = "imageUrl"
        case reviewCount = "review_count"
        case displayPhone = "display_phone"
        case businessHours = "business_hours"
        case id
        case alias
        case name
        case url
        case categories
        case rating
        case coordinates
        case price
        case location
        case phone
        case distance
        
    }
    var id : String?
    var alias : String
    var name : String
    var imageURL : String?
    var isClosed : Bool
    var url : String?
    var reviewCount : Int?
    var categories : [Category] = [Category]()
    var rating : Double?
    var coordinates : Coordinate
    var price : String?
    var location : Location?
    var phone : String?
    var displayPhone : String
    var distance : Double?
    var businessHours : [BusinessHours] = [BusinessHours]()
}

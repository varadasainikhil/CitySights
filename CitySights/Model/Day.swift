//
//  BusinessHours.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/14/25.
//

import Foundation

struct Day : Codable{
    
    enum CodingKeys : String, CodingKey {
        case isOvernight = "is_overnight"
        case start
        case end
        case day
    }
    
    var isOvernight : Bool
    var start : String
    var end : String
    var day : Int
}

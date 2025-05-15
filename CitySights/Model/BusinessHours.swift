//
//  BusinessHours.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/14/25.
//

import Foundation

struct BusinessHours : Codable{
    
    enum CodingKeys : String, CodingKey {
        case open
        case hoursType = "hours_type"
        case isOpenNow = "is_open_now"
    }
    
    var open : [Day] = [Day]()
    var hoursType : String
    var isOpenNow : Bool
}

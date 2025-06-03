//
//  TextHelper.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/3/25.
//

import Foundation

struct DistanceHelper{
    
    static func distanceAwayText(meters : Double) -> String{
        if meters > 1000 {
            return "\(Int(round(meters/1000))) km away"
        }
        else{
            return "\(Int(round(meters))) m away"
        }
    }
}

//
//  BusinessSearch.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/14/25.
//

import Foundation

struct BusinessSearch : Codable{
    var businesses : [Business] = [Business]()
    var total : Int
    var region : Region
}

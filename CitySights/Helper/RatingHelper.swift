//
//  RatingHelper.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 6/3/25.
//

import Foundation

struct RatingHelper{
    static func roundRatings(unroundedRating: Double)-> String{
        if unroundedRating > 0.5 && unroundedRating <= 1 {
            return "regular_1.0"
        }
        else if unroundedRating > 1 && unroundedRating <= 1.5 {
            return "regular_1.5"
        }
        else if unroundedRating > 1.5 && unroundedRating <= 2 {
            return "regular_2.0"
        }
        else if unroundedRating > 2 && unroundedRating <= 2.5 {
            return "regular_2.5"
        }
        else if unroundedRating > 2.5 && unroundedRating <= 3 {
            return "regular_3.0"
        }
        else if unroundedRating > 3 && unroundedRating <= 3.5 {
            return "regular_3.5"
        }
        else if unroundedRating > 3.5 && unroundedRating <= 4 {
            return "regular_4.0"
        }
        else if unroundedRating > 4 && unroundedRating <= 4.5 {
            return "regular_4.5"
        }
        else if unroundedRating > 4.5 && unroundedRating <= 5 {
            return "regular_5.0"
        }
        else{
            return "regular_0.0"
        }
    }
}



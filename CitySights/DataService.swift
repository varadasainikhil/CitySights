//
//  DataService.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import Foundation

struct DataService{
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch() async -> [Business]{
        //Check if apikey exists
        guard apiKey != nil else{
            print("API KEY not found")
            return [Business]()
        }
        
        //1. Create URL
        guard let url = URL(string: "https://api.yelp.com/v3/businesses/search?latitude=35.665517&longitude=139.770398&term=restaurants") else{
            print("Invalid URL String")
            return [Business]()
        }
        
        //2. Create Request
        var request = URLRequest(url: url)
        
        request.addValue("Bearer \(apiKey!)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "accept")
        
        //3. Send Request
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
                        
            // Parsing the JSON
            let decoder = JSONDecoder()
            let result = try decoder.decode(BusinessSearch.self, from: data)
            
            return result.businesses
        }
        catch{
            print("Error fetching data : \(error.localizedDescription)")
        }
        return [Business]()
    }
}

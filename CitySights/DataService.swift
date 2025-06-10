//
//  DataService.swift
//  CitySights
//
//  Created by Sai Nikhil Varada on 5/5/25.
//

import Foundation
import CoreLocation

struct DataService{
    
    let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func businessSearch(coordinate : CLLocationCoordinate2D, query : String?, options : String?, category : String?) async -> [Business]{
        // Check if apikey exists
        guard apiKey != nil else{
            print("API KEY not found")
            return [Business]()
        }
        
        var endpointURLString = "https://api.yelp.com/v3/businesses/search?latitude=\(coordinate.latitude)&longitude=\(coordinate.longitude)"
        
        // Add Query
        if query != nil && query != ""{
            endpointURLString.append("&term=\(String(describing: query?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)))")
        }
        
        // Add Options
        if options != nil && options != "" {
            endpointURLString.append("&attributes=\(String(describing: options))")
        }
        
        // Add categories
        if category != nil{
            endpointURLString.append("&category=\(String(describing: category))")
        }
        
        //1. Create URL
        guard let url = URL(string: endpointURLString) else{
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

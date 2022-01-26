//
//  NetworkManager.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation
import os

/// Allows fetching data from a `URL`.
struct NetworkManager {
    
    /// Attempts to load data of type `T` from `url`.
    static func load<T: Decodable>(url: URL, type: T.Type) -> Result<T, NetworkError> {
        if let data  = try? Data(contentsOf: url) {
            
            // Data available; try decoding as JSON.
            let decoder = JSONDecoder()
            
            // Decode data
            do {
                let result = try decoder.decode(T.self, from: data)
                
                // Log output
                // Note: NSLog seems to cut off output after a certain length,
                // so it's followed by a print statement to see all data in Xcode.
                NSLog("%@", NSString(string: "\(result)"))
                print("-----")
                print("\(result)")
                
                return .success(result)
            } catch let error {
                print(String(describing: error))
                return .failure(.decodingFailure)
            }
            
        } else {
            // Couldn't find the data at the URL/
            return .failure(.unavailable)
        }
    }
    
}

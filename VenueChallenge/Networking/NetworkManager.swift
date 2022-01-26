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
            
            let logger = os.Logger()
            logger.log("\(data)")
            
            // Data available; try decoding as JSON.
            let decoder = JSONDecoder()
            
            // Decode data
            do {
                let result = try decoder.decode(T.self, from: data)
                print(result)
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

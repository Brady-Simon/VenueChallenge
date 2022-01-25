//
//  NetworkManager.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation
import os

struct NetworkManager {
    
    /// Attempts to load data of type `T` from `url`.
    static func load<T: Decodable>(url: URL, type: T.Type) -> Result<T, NetworkError> {
        if let data  = try? Data(contentsOf: url) {
            
            // Data available; try decoding as JSON.
            let decoder = JSONDecoder()
            
            if let result = try? decoder.decode(T.self, from: data) {
                // Data successfully processed.
                let logger = os.Logger()
                logger.log("\(data)")
                return .success(result)
            } else {
                // Couldn't process the data.
                return .failure(.decodingFailure)
            }
            
        } else {
            // Couldn't find the data at the URL/
            return .failure(.unavailable)
        }
    }
    
}

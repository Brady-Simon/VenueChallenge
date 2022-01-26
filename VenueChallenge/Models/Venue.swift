//
//  Venue.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// A particular place found in a `Guide`.
struct Venue: Codable {
    
    /// The city in which this venue will appear.
    var city: String? = ""
    
    /// The state in which this venue will appear.
    var state: String? = ""
    
    /// A combination of `city` and `state` into one string.
    var location: String? {
        
        // Wrap city and state in case nil.
        let city = city ?? ""
        let state = state ?? ""
        
        // Ensure at least city or state is present.
        guard !city.isEmpty || !state.isEmpty else { return nil }
        
        // Return either city, state, or a combination if possible.
        if city.isEmpty {
            return state
        } else if state.isEmpty {
            return city
        } else {
            return "\(city), \(state)"
        }
    }
    
}

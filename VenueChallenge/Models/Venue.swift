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
    var city: String = ""
    
    /// The state in which this venue will appear.
    var state: String = ""
    
}

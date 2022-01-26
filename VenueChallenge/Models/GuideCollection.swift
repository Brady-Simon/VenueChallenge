//
//  VenueCollection.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// A collection of upcoming guides.
struct GuideCollection: Codable {
    
    /// The total number of elements in `data`.
    var total: Int
    
    /// The upcoming guides.
    var data: [Guide]
}

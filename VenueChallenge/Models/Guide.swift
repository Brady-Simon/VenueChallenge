//
//  Venue.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

struct Guide: Codable {
    
    /// A URL to more information about the guide.
    var url: String
    
    /// The date at which the venue starts.
    var startDate: String
    
    /// The date at which the venue ends.
    var endDate: String
    
    /// The venue's name.
    var name: String
    
    /// The URL for the icon.
    var icon: String
    
    var venue: Venue
    
    /// The type of object this represents.
    var objType: String
    
    /// Whether or not a login is required for this guide.
    var loginRequired: Bool
    
}

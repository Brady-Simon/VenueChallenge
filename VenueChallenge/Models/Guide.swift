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
    
    /// The venue for this guide.
    var venue: Venue? = nil
    
    /// The type of object this represents.
    var objType: String
    
    /// Whether or not a login is required for this guide.
    var loginRequired: Bool
    
}

extension Guide {
    /// The start date, formatted using a `DateFormatter` to get a real `Date`.
    var sortDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        return dateFormatter.date(from: startDate)
    }
}

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
    var total: String = "0"
    
    /// The upcoming guides.
    var data: [Guide] = []
}

extension GuideCollection {
    
    /// Groups guides by start date and returns a list of lists
    func guidesGroupedByStartDate() -> [[Guide]] {
        // Sort the guides and find unique start dates to group by.
        let sortedGuides = data.sorted { $0.sortDate ?? Date() < $1.sortDate ?? Date() }
        let uniqueStartDates = Set(sortedGuides.map { $0.startDate }).sorted(by: compareStartDates(_:_:))
        
        // Go through and add a list for each unique start date.
        var groupedGuides = [[Guide]]()
        for uniqueDate in uniqueStartDates {
            groupedGuides.append(sortedGuides.filter { $0.startDate == uniqueDate })
        }
        
        return groupedGuides
    }
    
    /// Compares two start dates formatted like `Jan 1, 2000`.
    private func compareStartDates(_ startDate1: String, _ startDate2: String) -> Bool {
        // The date formatter to use
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM dd, yyyy"
        
        // Convert start dates to actual dates
        let defaultDate = Date()
        let date1 = dateFormatter.date(from: startDate1) ?? defaultDate
        let date2 = dateFormatter.date(from: startDate2) ?? defaultDate
        
        return date1 < date2
    }
    
}

//
//  GuideCollectionResource.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation
import os

/// Manages the URL and resources associated with loading remote guides.
struct GuideCollectionResource {
    
    /// The URL to use for fetching upcoming guides.
    var url: String = "https://guidebook.com/service/v2/upcomingGuides/"
    
    /// Fetches the `GuideCollection` at `url`,
    /// or returns `nil` if something goes wrong.
    func fetch() -> GuideCollection? {
        // Make sure the URL can be created.
        guard let networkUrl = URL(string: url) else { return nil }
        
        // Load up the API
        let result = NetworkManager.load(url: networkUrl, type: GuideCollection.self)
        
        switch result {
        case .success(let collection):
            return collection
        case .failure(let error):
            // Debug the output and return nil
            let logger = os.Logger()
            logger.log("Failed to fetch guides: \(error.localizedDescription)")
            return nil
        }
    }
    
}

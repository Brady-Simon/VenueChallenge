//
//  GuideCollectionResource.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// Manages the URL and resources associated with loading remote guides.
/// Serves as a convenient location to store URLs and wrap `NetworkManager`.
struct GuideResource {
    
    /// The URL to use for fetching upcoming guides.
    var url: String = "https://guidebook.com/service/v2/upcomingGuides/"
    
    /// Fetches the `GuideCollection` at `url`,
    /// or returns `nil` if something goes wrong.
    func fetch() -> Result<GuideCollection, NetworkError> {
        // Make sure the URL can be created.
        guard let networkUrl = URL(string: url) else { return .failure(.unavailable) }
        
        // Load from the network and return the result.
        let result = NetworkManager.load(url: networkUrl, type: GuideCollection.self)
        return result
    }
    
}

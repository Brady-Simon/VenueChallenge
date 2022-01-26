//
//  GuideViewModel.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// A view model that manages upcoming guides.
class GuideViewModel: ObservableObject {
    
    /// The collection of guides being shown in the application.
    @Published var guideCollection = GuideCollection()
    
}

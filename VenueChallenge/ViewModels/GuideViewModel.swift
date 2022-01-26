//
//  GuideViewModel.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import Foundation

/// A view model that manages upcoming guides.
class GuideViewModel: ObservableObject {
    
    /// Whether or not the view model is loading data.
    @Published var isLoading: Bool = false
    
    /// The collection of guides being shown in the application.
    @Published var guideCollection = GuideCollection()
    
    /// The current error message.
    @Published var errorMessage: String? = nil
    
    /// Whether or not the error message is being shown.
    @Published var showingErrorMessage: Bool = false
    
    /// Fetches upcoming guides and updates `guideCollection`.
    func fetchUpcomingGuides() {
        
        // Reset loading state before fetching.
        isLoading = true
        resetErrorMessage()
        
        // Perform the fetch asynchronously.
        DispatchQueue.global(qos: .userInitiated).async {
            
            // Fetch the necessary resources.
            let resource = GuideResource()
            let result = resource.fetch()
            
            // Switch over result and update state on main thread.
            DispatchQueue.main.async {
                switch result {
                case .success(let collection):
                    // Success; update collection.
                    self.guideCollection = collection
                case .failure(let networkError):
                    // Show the error in the view.
                    self.errorMessage = networkError.localizedDescription
                    self.showingErrorMessage = true
                }
                
                // Reset loading state.
                self.isLoading = false
            }
        }
    }
    
    /// Resets the viewmodel's error state.
    func resetErrorMessage() {
        errorMessage = nil
        showingErrorMessage = false
    }
    
}

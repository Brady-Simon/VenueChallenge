//
//  ContentView.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import SwiftUI

struct ContentView: View {
    
    /// The view model containing upcoming guides.
    @StateObject var viewModel = GuideViewModel()
    
    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView("Loading guides...")
            } else if viewModel.guideCollection.data.isEmpty {
                Text("No upcoming guides.")
            } else {
                GuideListView(viewModel: viewModel)
            }
        }
        .onAppear(perform: viewModel.fetchUpcomingGuides)
        .alert("Error", isPresented: $viewModel.showingErrorMessage) {
            Button("Cancel", action: {
                viewModel.showingErrorMessage = false
            })
            Button("Try again", action: viewModel.fetchUpcomingGuides)
        } message: {
            Text(viewModel.errorMessage ?? "Something went wrong.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

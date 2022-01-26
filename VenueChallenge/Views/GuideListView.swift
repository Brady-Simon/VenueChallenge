//
//  GuideList.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import SwiftUI

struct GuideListView: View {
    
    @ObservedObject var viewModel: GuideViewModel
    
    /// Guides that are grouped by start date.
//    var groupedGuides: [[Guide]] {
//        viewModel
//            .guideCollection
//            .guidesGroupedByStartDate()
//    }
    
    var body: some View {
        List {
            
            // Group the guides by start date.
            let groupedGuides = viewModel
                .guideCollection
                .guidesGroupedByStartDate()
            
            // Section loop
            ForEach(0..<groupedGuides.count, id: \.self) { startIndex in
                let guides = groupedGuides[startIndex]
                Section(guides.first?.startDate ?? "") {

                    // Cell loop
                    ForEach(0..<guides.count, id: \.self) { guideIndex in
                        GuideCell(guide: guides[guideIndex])
                    }
                }
            }
        }
        .navigationTitle("\(viewModel.guideCollection.data.count) guides")
    }
}

struct GuideList_Previews: PreviewProvider {
    static var previews: some View {
        GuideListView(viewModel: GuideViewModel())
    }
}

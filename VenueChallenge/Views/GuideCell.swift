//
//  GuideCell.swift
//  VenueChallenge
//
//  Created by Brady Simon on 1/25/22.
//

import SwiftUI

/// A cell designed to be displayed in a `List`.
struct GuideCell: View {
    
    /// The guide being displayed in the view.
    let guide: Guide
    
    var guideDuration: String {
        "\(guide.startDate) - \(guide.endDate)"
    }
    
    var body: some View {
        HStack {
            // Image
            AsyncImage(url: URL(string: guide.icon)) { image in
                 image
                    .resizable()
                    .aspectRatio(nil, contentMode: .fit)
                    .frame(maxWidth: 75, maxHeight: 75)
            } placeholder: {
                ProgressView()
                    .frame(width: 75, height: 75)
            }
            .padding(.trailing)
            
            VStack(alignment: .leading) {
                
                // Name
                Text(guide.name)
                    .bold()
                    .padding(.bottom, 4)
                    .fixedSize(horizontal: false, vertical: true)
                
                // City and state
                if let location = guide.venue?.location {
                    Text(location)
                }
                
                // Start and end date
                Text("Ends \(guide.endDate)")
            }
            
            Spacer()
        }
    }
}

struct GuideCell_Previews: PreviewProvider {
    
    static var previews: some View {
        GuideCell(
            guide: Guide(
                url: "/guide/160147",
                startDate: "Jan 28, 2022",
                endDate: "Jan 29, 2022",
                name: "January Presidential Weekend",
                icon: "https://s3.amazonaws.com/media.guidebook.com/service/VIGBi4yAAODln075ZKHpQdV5To3DvwlUQYknViPw/logo.png",
                venue: Venue(
                    city: "Atlanta",
                    state: "GA"
                ),
                objType: "guide",
                loginRequired: false
            )
        )
    }
}

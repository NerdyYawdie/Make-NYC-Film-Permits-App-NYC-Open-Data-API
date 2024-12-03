//

import SwiftUI

struct DetailView: View {
    
    let filmPermit: FilmPermit
    
    var body: some View {
        Form {
            Section {
                Text("Event ID: \(filmPermit.eventid)")
                Text("Event Type: \(filmPermit.eventtype)")
            } header: {
                Text("General")
            }
            
            Section {
                Text("Category: \(filmPermit.category)")
                Text("Sub Category: \(filmPermit.subcategoryname)")
            } header: {
                Text("Category")
            }

            Section {
                Text("Agency: \(filmPermit.eventagency)")
                
            } header: {
                Text("Agency")
            }
            
            Section {
                Text("Parking Held: \(filmPermit.parkingheld)")
                Text("Borough: \(filmPermit.borough)")
            } header: {
                Text("Location")
            }
        }
        .navigationTitle(Text(filmPermit.eventid))
    }
}

#Preview {
    NavigationStack {
    DetailView(filmPermit: FilmPermit(eventid: "807084", eventtype: "Shooting Permit", startdatetime: "2024-08-25T01:00:00.000", enddatetime: "2024-08-25T13:00:00.000", eventagency: "Mayor's Office of Media & Entertainment", parkingheld: "WEST   48 STREET between 6 AVENUE and 7 AVENUE", borough: "Manhattan", communityboard_s: "5", category: "Television", subcategoryname: "News", country: "United States of America", zipcode_s: "10036, 10105"))
}
}

//

import SwiftUI

struct RowView: View {
    
    var viewModel: RowViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            HStack(alignment: .top) {
                VStack(alignment: .leading) {
                    Text(viewModel.filmPermit.eventid)
                        .bold()
                    Text(viewModel.filmPermit.eventtype)
                }
                
                Spacer()
                
                Text("\(viewModel.filmPermit.category), \(viewModel.filmPermit.subcategoryname)")
                
            }
            .padding(.bottom)
            
            VStack(alignment: .leading) {
                Text(viewModel.filmPermit.parkingheld.capitalized)
                    .font(.subheadline)
                    .lineLimit(2)
                    .padding(.bottom, 5)
                
                Text(viewModel.filmPermit.eventagency)
                    .font(.subheadline)
                    .foregroundStyle(.tertiary)
            }
            
            
            if let startDate = viewModel.formatStartDate() {
                Divider()
                Text(startDate, style: .date)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
        }
    }
}

#Preview {
    RowView(viewModel: RowViewModel(filmPermit: FilmPermit(eventid: "807084", eventtype: "Shooting Permit", startdatetime: "2024-08-25T01:00:00.000", enddatetime: "2024-08-25T13:00:00.000", eventagency: "Mayor's Office of Media & Entertainment", parkingheld: "WEST   48 STREET between 6 AVENUE and 7 AVENUE", borough: "Manhattan", communityboard_s: "5", category: "Television", subcategoryname: "News", country: "United States of America", zipcode_s: "10036, 10105")))
        .padding()
}

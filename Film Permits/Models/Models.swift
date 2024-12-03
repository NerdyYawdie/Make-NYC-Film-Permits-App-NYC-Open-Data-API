//

import Foundation

struct FilmPermit: Decodable, Identifiable {
    let id = UUID()
    let eventid: String
    let eventtype: String
    let startdatetime: String
    let enddatetime: String
    let eventagency: String
    let parkingheld: String
    let borough: String
    let communityboard_s: String
    let category: String
    let subcategoryname: String
    let country: String
    let zipcode_s: String
}

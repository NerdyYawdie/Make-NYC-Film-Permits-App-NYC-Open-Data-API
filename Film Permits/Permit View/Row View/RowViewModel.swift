//

import Foundation

class RowViewModel {
    
    let filmPermit: FilmPermit
    let dateFormatter = DateFormatter()
    
    init(filmPermit: FilmPermit) {
        self.filmPermit = filmPermit
    }
    
    func formatStartDate() -> Date? {
        dateFormatter.dateFormat = "YYYY-MM-dd'T'HH:mm:ss.sss"
        let date = dateFormatter.date(from: filmPermit.startdatetime)
        return date
    }
}

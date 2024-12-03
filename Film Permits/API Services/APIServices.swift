//

import Foundation

protocol APIServices {
    func fetchFilmPermit(eventID: String) async throws -> [FilmPermit]
}

enum FilmPermitServiceError: Error {
    case invalidURL
    case invalidResponse
    case custom(String)
}

class FilmPermitServices: APIServices {
    
    private let endpoint: String = "https://data.cityofnewyork.us/resource/tg4x-b46p.json"
    
    func fetchFilmPermit(eventID: String) async throws -> [FilmPermit] {
        
        var urlComponents = URLComponents(string: endpoint)
        urlComponents?.queryItems = [URLQueryItem(name: "eventid", value: eventID)]
        
        guard let url = urlComponents?.url else {
            throw FilmPermitServiceError.invalidURL
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpURLResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpURLResponse.statusCode) else {
                throw FilmPermitServiceError.invalidResponse
            }
            
            do {
                let filmPermits = try JSONDecoder().decode([FilmPermit].self, from: data)
                return filmPermits
            } catch {
                print(error)
                throw FilmPermitServiceError.custom(error.localizedDescription)
            }
            
        } catch {
            throw FilmPermitServiceError.custom(error.localizedDescription)
        }
    }
    
    
}

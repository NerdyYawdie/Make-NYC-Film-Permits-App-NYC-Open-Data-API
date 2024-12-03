//

import Foundation

class PermitViewModel: ObservableObject {
    
    @Published var searchTerm: String = ""
    @Published var filmPermits: [FilmPermit] = []
    
    @Published var isLoading: Bool = false
    @Published var showErrorAlert: Bool = false
    @Published var errorMessage: String = ""
    
    let services: APIServices
    
    init(services: APIServices = FilmPermitServices()) {
        self.services = services
    }
    
    @MainActor
    func fetchFilmPermits() async {
        
        do {
            isLoading = true
            filmPermits = try await services.fetchFilmPermit(eventID: searchTerm)
            
            isLoading = false
        } catch {
            isLoading = false
            errorMessage = error.localizedDescription
            showErrorAlert.toggle()
        }
    }
}

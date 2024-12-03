//

import SwiftUI

struct PermitView: View {
    
    @StateObject var viewModel = PermitViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.filmPermits.isEmpty {
                    ContentUnavailableView("No Film Permits Found", systemImage: "magnifyingglass", description: Text("Please enter a new Event ID to search for your permit"))
                } else {
                    List(viewModel.filmPermits) { filmPermit in
                        NavigationLink {
                            DetailView(filmPermit: filmPermit)
                        } label: {
                            RowView(viewModel: RowViewModel(filmPermit: filmPermit))
                        }

                    }
                }
                
            }
            .navigationTitle(Text("Film Permits"))
            .searchable(text: $viewModel.searchTerm, prompt: Text("Enter event ID to search for film permit"))
            .onSubmit(of: .search, {
                Task {
                    await viewModel.fetchFilmPermits()
                }
            })
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text(viewModel.errorMessage))
            }
            .overlay {
                if viewModel.isLoading {
                    ProgressView(LocalizedStringKey("Fetching Film Permit Info..."))
                }
            }
        }
    }
}

#Preview {
    PermitView()
}

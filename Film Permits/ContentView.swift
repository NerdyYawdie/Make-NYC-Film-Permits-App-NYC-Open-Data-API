//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PermitView()
                .tabItem {
                    VStack {
                        Image(systemName: "camera")
                        
                        Text("Film Permits")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}

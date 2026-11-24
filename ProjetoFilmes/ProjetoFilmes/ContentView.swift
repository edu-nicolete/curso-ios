import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView {
            FilmeListView()
                .tabItem {
                    Label("Filmes", systemImage: "film")
                }
            
            FavoritosView()
                .tabItem {
                    Label("Favoritos", systemImage: "heart.fill")
                }
        }
        .tint(.blue)
    }
}

#Preview {
    ContentView()
        .modelContainer(for: FilmeFavorito.self, inMemory: true)
}


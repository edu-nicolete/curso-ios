import SwiftUI

struct ContentView: View {
    @State
    private var favoritos: Set<UUID> = []
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 18) {
                    VStack(alignment: .leading, spacing: 18) {
                       Text("Sua próxima aventura começa aqui!")
                            .font(.title2.bold())
                        
                        Text("Explore destinos incríveis pelo mundo.")
                             .font(.subheadline)
                             .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    
                    ForEach(PacotesViagem.lista) { pacote in
                        NavigationLink(value: pacote.id) {
                            CardPacoteView(pacote: pacote,
                                           favoritado: favoritos.contains(pacote.id)) {
                                alternar(pacote)
                            }
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal)
                    }
                }
                .padding(.vertical)
            }
            .background(Color.gray.opacity(0.05))
            .navigationTitle("Explorar viagens")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink {
                        TelaFavoritosView(favoritos: $favoritos)
                    } label: {
                        HStack(spacing: 5) {
                            Image(systemName: "heart.fill")
                                .foregroundStyle(.red)
                            
                            Text("\(favoritos.count)")
                                .fontWeight(.semibold)
                        }
                    }
                }
            }
            .navigationDestination(for: UUID.self) { id in
                if let pacote = PacotesViagem.lista.first(where: { $0.id == id }) {
                    DetalhesView(pacote: pacote, favoritos: $favoritos)
                }
            }
        }
    }
    
    private func alternar(_ pacote: PacoteViagem) {
        if favoritos.contains(pacote.id) {
            favoritos.remove(pacote.id)
        } else {
            favoritos.insert(pacote.id)
        }
    }
}

#Preview {
    ContentView()
}


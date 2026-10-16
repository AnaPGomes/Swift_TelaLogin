
import SwiftUI

struct CarrosselView: View {
    let titulo: String

    @State private var viewModel = NasaViewModel()
    @State private var carregando = true

    var body: some View {
        VStack {
            if carregando {
                ProgressView("Carregando imagens...")
                    .tint(.purple)

            } else if viewModel.Planetas.isEmpty {
                Text("Não foi possível carregar as imagens.")
                    .foregroundStyle(.white)

            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        ForEach(viewModel.Planetas, id: \.date) { planeta in
                            NavigationLink(value: planeta) {
                                VStack(alignment: .leading, spacing: 10) {
                                    if planeta.media_type == "image" {
                                        AsyncImage(
                                            url: URL(string: planeta.url)
                                        ) { fase in
                                            if let imagem = fase.image {
                                                imagem
                                                    .resizable()
                                                    .scaledToFill()
                                            } else if fase.error != nil {
                                                Image(systemName: "photo")
                                                    .frame(
                                                        width: 230,
                                                        height: 150
                                                    )
                                            } else {
                                                ProgressView()
                                                    .frame(
                                                        width: 230,
                                                        height: 150
                                                    )
                                            }
                                        }
                                        .frame(width: 230, height: 150)
                                        .clipped()
                                    }

                                    Text(planeta.title)
                                        .font(.headline)
                                        .lineLimit(2)
                                        .foregroundStyle(.white)

                                    Text(planeta.date)
                                        .font(.caption)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                                .padding()
                                .frame(width: 250)
                                .background(Color.purple.opacity(0.4))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 15)
                                )
                            }
                            .buttonStyle(.plain)
                        }
                    }
                    .padding()
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .navigationTitle(titulo)
        .task {
            await viewModel.QualidadePlanetario()
            carregando = false
        }
        .navigationDestination(for: NasaPlanet.self) { planeta in
            DetalhesView(planeta: planeta)
        }
    }
}


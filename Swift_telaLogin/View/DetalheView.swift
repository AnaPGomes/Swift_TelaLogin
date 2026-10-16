
import SwiftUI

struct DetalhesView: View {
    let planeta: NasaPlanet

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                if planeta.media_type == "image" {
                    AsyncImage(
                        url: URL(string: planeta.hdurl ?? planeta.url)
                    ) { fase in
                        if let imagem = fase.image {
                            imagem
                                .resizable()
                                .scaledToFit()
                        } else if fase.error != nil {
                            Image(systemName: "photo")
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                        } else {
                            ProgressView()
                                .tint(.purple)
                                .frame(maxWidth: .infinity)
                                .frame(height: 220)
                        }
                    }
                }

                Text(planeta.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.white)

                Text(planeta.date)
                    .font(.subheadline)
                    .foregroundStyle(.purple)

                Text(planeta.explanation)
                    .font(.body)
                    .foregroundStyle(.white)

                if let copyright = planeta.copyright {
                    Text("Créditos: \(copyright)")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.7))
                }
            }
            .padding()
        }
        .background(Color.black)
        .navigationTitle("Detalhes")
        .navigationBarTitleDisplayMode(.inline)
    }
}


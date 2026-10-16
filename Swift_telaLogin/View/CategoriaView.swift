//
//  CategoriaView.swift
//  Swift_telaLogin
//
//  Created by ANA PAULA BEZERRA GOMES on 14/10/26.
//


import SwiftUI


import SwiftUI

struct CategoriaView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Text("Exploração Planetário")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.purple)

                Text("Explore o universo")
                    .font(.headline)
                    .foregroundStyle(.white)

                NavigationLink("Imagem do dia") {
                    CarrosselView(titulo: "Imagem do dia")
                }
                
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                NavigationLink("Galáxias e nebulosas") {
                    CarrosselView(titulo: "Galáxias e nebulosas")
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)

                NavigationLink("Universo e espaço") {
                    CarrosselView(titulo: "Universo e espaço")
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
            }
            .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black)
                        .navigationTitle("Início")
                        .toolbarColorScheme(.dark, for: .navigationBar)
                        .toolbarBackground(.black, for: .navigationBar)
                        .toolbarBackground(.visible, for: .navigationBar)
        }
        .preferredColorScheme(.dark)
    }
}
#Preview {
    CategoriaView()
}

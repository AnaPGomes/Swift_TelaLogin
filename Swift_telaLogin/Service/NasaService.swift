//
//  NasaService.swift
//  Swift_telaLogin
//
//  Created by ANA PAULA BEZERRA GOMES on 14/10/26.
//


import Foundation

class NasaService {
    private let url = "https://science.nasa.gov/wp-json/wp/v2/apod-basic/?api_key=DEMO_KEY"

    func PegandoInformacoesPlanetais() async throws -> [NasaPlanet] {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)////me dê os dados que vieram da internet, e ele retorna com json, ele vem dentro de data, temos tbm o _, pq a funcao retorna http, mas n queremos saber disso agr

        let ObjetoTransformado = try JSONDecoder().decode([NasaPlanet].self, from: data)//Pegue o JSON que veio da API e transforme em um objeto Swift, inclusive e o codable autoriza isso, ent ele deixa de ser oq o site manda pra ser o nasaResponse, inclusive quem consegue dizer que cada{} e um obj de NasaPlanet o proprio Decoder

        return ObjetoTransformado
    }
}

//
//  NasaViewModel.swift
//  Swift_telaLogin
//
//  Created by ANA PAULA BEZERRA GOMES on 14/10/26.
//


import Observation

@Observable
class NasaViewModel {
    var carregou: Bool = false
    var Planetas: [NasaPlanet] = []
    //Planetas=  await NasaService.PegandoInformacoesPlanetais() //ela ira esperar, aqui eu tinha deixado fora da funcao
    //mas n e bom pois o msm carregamento estara preso, so seria bom aqui como atributo se fosse utlizado em outras funcoes

    func QualidadePlanetario() async -> [NasaPlanet] { //uma funcao assicrona que espera a net receber a requisicao dela e responder, o await e pra esperar a resposta chegar
        do {

            Planetas = try await NasaService().PegandoInformacoesPlanetais()

            if Planetas.isEmpty {
                carregou = false
                print("Nao foi possivel carregar os dados, Lamentamos :c")

            } else {
                carregou = true
            }

            return Planetas

        } catch {
            carregou = false
            print("erro ao carregar os dados:", error)
        }

        return Planetas
    }
}

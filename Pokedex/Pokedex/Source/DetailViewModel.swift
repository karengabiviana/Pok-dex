//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 18/07/24.
//

import UIKit

class DetailViewModel {
    
    let service: DetailServiceProtocol
    var pokemonDetails: Pokemon?
    
    init(service: DetailServiceProtocol) {
        self.service = service
    }
    
    func loadData(pokemonIndex:String, completion: @escaping () -> Void) {
        service.getPokemonDetails(index: pokemonIndex) { result in
            switch result {
            case .success(let data):
                self.pokemonDetails = data
                completion()
            case .failure(let error):
                completion()
            }
        }
    }
    
}

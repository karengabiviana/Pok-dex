//
//  ViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 27/06/24.
//

import UIKit

class ListViewModel {
    
    let service: ListServiceProtocol
    var pokemon: [PokemonSummary] = []
    
    init(service: ListServiceProtocol) {
        self.service = service
    }
    
    func loadData(completion: @escaping () -> Void) {
        service.getPokemonList { result in
            switch result {
            case .success(let data):
                self.pokemon = data
                completion()
            case .failure(let error):
                completion()
            }
        }
    }
}

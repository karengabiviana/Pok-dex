//
//  ViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 27/06/24.
//

import UIKit

class ViewModel {
    
    let service: ServiceProtocol
    var pokemon: [Pokemon] = []
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func loadData(completion: @escaping () -> Void) {
        service.getPokemon { result in
            switch result {
            case .success(let data):
                self.pokemon = data
                print("\(self.pokemon)")
                completion()
            case .failure(let error):
                print("\(self.pokemon)")
                completion()
            }
        }
    }
    @objc func doneButtonPressed() {
        // button pressed
    }
    
}

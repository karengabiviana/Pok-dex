//
//  ViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 27/06/24.
//

import UIKit

class ViewModel {
    
    let service: ServiceProtocol
    
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    func loadData() {
        service.getPokemon { result in
            switch result {
            case .success(let data):
                //carregar a lista
                break
            case .failure(let error):
                // lidar com o erro
                break
            }
        }
    }
    
    @objc func doneButtonPressed() {
        // button pressed
    }
    
}

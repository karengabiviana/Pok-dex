//
//  ViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 14/06/24.
//

import SwiftUI
import Combine

class ViewModel: ObservableObject {
    let contentView = ContentView()
    let service = Service()
    
    @Published var textFieldText: String = ""
    
    func buttonPressed() {
        service.get(pokemonName: textFieldText) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(data):
//                    self.updateUI()
//                case .failure(error):
//                    self.errorAlert()
//                }
//            }
        }
    }
    
    func updateUI() {
        
    }
    
    func errorAlert() {
        
    }
}

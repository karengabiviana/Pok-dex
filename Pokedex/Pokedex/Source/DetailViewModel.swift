//
//  DetailViewModel.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 18/07/24.
//

import UIKit

class DetailViewModel {
    
    let service: DetailServiceProtocol
    private var pokemonDetails: Pokemon?
    private let viewController = DetailViewController()
    
    init(service: DetailServiceProtocol) {
        self.service = service
    }
    
    func loadData(pokemonIndex: Int) {
        service.getPokemonDetails(index: pokemonIndex) { result in
            if let data = try? result.get() {
                self.updateUI(with: data)
            }
        }
    }
    
    func updateUI(with pokemon: Pokemon) {
        DispatchQueue.main.async {
            self.viewController.indexLabel.text = "\(pokemon.index)"
            self.viewController.pokemonLabel.text = pokemon.name.capitalized
            self.viewController.heightLabel.text = "Height: \(Double(pokemon.height) / 10.0)m"
            self.viewController.weightLabel.text = "Weight: \(Double(pokemon.weight) / 10.0)kg"
            // Image
            if let imageUrl = pokemon.image.front_default, let url = URL(string: imageUrl) {
                self.downloadImage(from: url)
            }
            // Types
            self.viewController.tagStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
            for typeEntry in pokemon.types {
                let tagLabel = self.createTagLabel(text: typeEntry.type.name.capitalized)
                self.viewController.tagStackView.addArrangedSubview(tagLabel)
            }
        }
    }
    
    func downloadImage(from url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.viewController.pokemonImage.image = UIImage(data: data)
            }
        }.resume()
    }
    
    func createTagLabel(text: String) -> PaddingLabel {
        let label = PaddingLabel()
        label.text = text
        label.textColor = .white
        label.backgroundColor = .blue
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        // Add padding
        label.textInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        
        return label
    }
}

//
//  ViewController.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 06/06/24.
//

// Codable -> protocolo de comunicação -> uncodable = serialização dos dados - enviar -> codable -> receber as informações

import UIKit

class DetailViewController: UIViewController {
    let service = Service()
    
    var indexLabel: UILabel = {
        let label = UILabel()
        label.text = "#000"
        label.textColor = .red
        return label
    }()
    
    var pokemonLabel: UILabel = {
        let label = UILabel()
        label.text = "Pokémon"
        label.textColor = .black
        return label
    }()
    
    var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var tagStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var additionalInfosStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "Height: 0.0m"
        return label
    }()
    
    var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Weight: 0.0kg"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        view.addSubview(indexLabel)
        view.addSubview(pokemonLabel)
        view.addSubview(pokemonImage)
        view.addSubview(tagStackView)
        view.addSubview(additionalInfosStackView)
        
        addTagsToStackView()
        addAdditionalInfosToStackView()
        constrainstLayout()
    }
    
    func errorAlertController() {
        let alert = UIAlertController(title: "Pokémon não encontrado", message: "Tente novamente", preferredStyle: .alert )
        
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func updateUI(with pokemon: Pokemon) {
        indexLabel.text = "#\(pokemon.index)"
        pokemonLabel.text = pokemon.name.capitalized
        heightLabel.text = "Height: \(Double(pokemon.height) / 10.0)m"
        weightLabel.text = "Weight: \(Double(pokemon.weight) / 10.0)kg"
        // Image
        if let imageUrl = pokemon.image.front_default, let url = URL(string: imageUrl) {
            downloadImage(from: url)
        }
        // Types
        tagStackView.arrangedSubviews.forEach{ $0.removeFromSuperview() }
        for typeEntry in pokemon.types {
            let tagLabel = createTagLabel(text: typeEntry.type.name.capitalized)
            tagStackView.addArrangedSubview(tagLabel)
        }
    }
    
    func downloadImage(from url: URL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    self.pokemonImage.image = UIImage(data: data)
                }
            }.resume()
        }
    
    func constrainstLayout() {
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        additionalInfosStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            indexLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 80),
            indexLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pokemonLabel.topAnchor.constraint(equalTo: indexLabel.bottomAnchor, constant: 16),
            pokemonLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pokemonImage.topAnchor.constraint(equalTo: pokemonLabel.bottomAnchor, constant: 16),
            pokemonImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokemonImage.widthAnchor.constraint(equalToConstant: 240),
            pokemonImage.heightAnchor.constraint(equalToConstant: 240),
            
            tagStackView.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor, constant: 16),
            tagStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            additionalInfosStackView.topAnchor.constraint(equalTo: tagStackView.bottomAnchor, constant: 16),
            additionalInfosStackView.leadingAnchor.constraint(equalTo: pokemonImage.leadingAnchor)
        ])
    }
    
    func addTagsToStackView() {
        let tags = ["Tipo"]
        for tag in tags {
            let tagLabel = createTagLabel(text: tag)
            tagStackView.addArrangedSubview(tagLabel)
        }
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
    
    func addAdditionalInfosToStackView() {
        additionalInfosStackView.addArrangedSubview(heightLabel)
        additionalInfosStackView.addArrangedSubview(weightLabel)
    }
}


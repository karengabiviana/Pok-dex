//
//  ViewController.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 06/06/24.
//

// Codable -> protocolo de comunicação -> uncodable = serialização dos dados - enviar -> codable -> receber as informações

import UIKit

class DetailViewController: UIViewController {
    private var viewModel: DetailViewModel!
    
    var selectedIndex: Int?
    
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
    
    private var additionalInfosStackView: UIStackView = {
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
        
        let service = DetailService()
        viewModel = DetailViewModel(service: service)
        
        configureLayout()
        viewModel.loadData(pokemonIndex: selectedIndex ?? 1)
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
    
    func constrainstLayout() {
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        additionalInfosStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            indexLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
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
            let tagLabel = viewModel.createTagLabel(text: tag)
            self.tagStackView.addArrangedSubview(tagLabel)
        }
    }
    
    func addAdditionalInfosToStackView() {
        additionalInfosStackView.addArrangedSubview(heightLabel)
        additionalInfosStackView.addArrangedSubview(weightLabel)
    }
}


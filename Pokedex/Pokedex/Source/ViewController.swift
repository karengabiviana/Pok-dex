//
//  ViewController.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 06/06/24.
//

// Codable -> protocolo de comunicação -> uncodable = serialização dos dados - enviar -> codable -> receber as informações

import UIKit

class ViewController: UIViewController {
    let textfield: UITextField = {
        let field = UITextField()
        field.placeholder = "Que Pokémon você quer pesquisar?"
        field.borderStyle = .roundedRect
        return field
    }()
    
    let doneButton: UIButton = {
        let action = UIAction(title: "Pesquisar", image: nil, identifier: nil) { _ in
            print("Done button pressed")
        }
        let button = UIButton(configuration: .borderedTinted(), primaryAction: action)
        return button
    }()
    
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
        // sprites
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.checkmark
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
        testingService()
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        view.addSubview(textfield)
        view.addSubview(doneButton)
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
        textfield.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        additionalInfosStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            textfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            doneButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            indexLabel.topAnchor.constraint(equalTo: doneButton.bottomAnchor, constant: 80),
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
        let tags = ["Fire", "Flying", "Legendary"]
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
    
    func testingService() {
        let service = Service()
        service.get(pokemonName: "pikachu") { result in
            DispatchQueue.main.async {
                switch result {
                case let .failure(error):
                    print(error)
                case let .success(data):
                    print(data)
                }
            }
        }
    }
}


//
//  ViewController.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 06/06/24.
//

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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        view.addSubview(textfield)
        view.addSubview(doneButton)
        view.addSubview(indexLabel)
        view.addSubview(pokemonLabel)
        view.addSubview(pokemonImage)
        view.addSubview(tagStackView)
        
        addTagsToStackView()
        constrainstLayout()
    }
    
    func constrainstLayout() {
        textfield.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        indexLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonLabel.translatesAutoresizingMaskIntoConstraints = false
        pokemonImage.translatesAutoresizingMaskIntoConstraints = false
        tagStackView.translatesAutoresizingMaskIntoConstraints = false
        
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
            tagStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
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
}


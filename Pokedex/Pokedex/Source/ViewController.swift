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

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        view.addSubview(textfield)
        view.addSubview(doneButton)
        constrainstLayout()
    }
    
    func constrainstLayout() {
        textfield.translatesAutoresizingMaskIntoConstraints = false
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            textfield.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            textfield.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -40),
            
            doneButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 20),
            doneButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}


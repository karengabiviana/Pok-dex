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
        return field
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
    }
    
    func configureLayout() {
        view.backgroundColor = .white
        view.addSubview(textfield)
        constrainstLayout()
    }
    
    func constrainstLayout() {
        textfield.translatesAutoresizingMaskIntoConstraints = false
        textfield.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textfield.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
    }

}


//
//  CustomCell.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 04/07/24.
//

import UIKit

class CustomCell: UITableViewCell {
    let index = UILabel()
    let pokemonName = UILabel()
    
    lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .leading
        stackView.addArrangedSubview(index.self)
        stackView.addArrangedSubview(pokemonName.self)
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

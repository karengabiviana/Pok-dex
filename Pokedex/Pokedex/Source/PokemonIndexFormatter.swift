//
//  PokemonIndexFormatter.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 26/08/24.
//

import UIKit

protocol IndexFormatable {
    var index: String { get }
}

extension IndexFormatable {
    var formattedIndex: String {
        PokemonIndexFormatter.format(index)
    }
}

enum PokemonIndexFormatter {
    /// Adds padding, eg: from "1" to "#001"
    /// In case of failure, returnuns empty string
    static func format(_ index: String) -> String {
        Int(index).map(format(_:)) ?? ""
    }
    
    static func format(_ index: Int) -> String {
        /// Adds padding, eg: from 1 to "#001"
        String(format: "#%03d", index)
    }
}

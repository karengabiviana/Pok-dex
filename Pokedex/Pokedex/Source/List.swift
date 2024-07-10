//
//  List.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 04/07/24.
//

import UIKit

struct List: Decodable {
    var count: Int
    var results: [PokemonSummary]
}

struct PokemonSummary: Decodable {
    let name: String
    let url: URL
}

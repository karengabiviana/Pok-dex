//
//  Pokemon.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 13/06/24.
//

import UIKit

struct Pokemon: Decodable {
    let index: Int
    let name: String
    let image: PokemonSprites
    let types: [PokemonTypeEntry]
    let height: Int
    let weight: Int
    
    enum CodingKeys: String, CodingKey {
        case index = "id"
        case name
        case image = "sprites"
        case types
        case height
        case weight
    }
    
}

struct PokemonSprites: Decodable {
    let front_default: String?
}

struct PokemonTypeEntry: Decodable {
    let slot: Int
    let type: PokemonType
}

struct PokemonType: Decodable {
    let name: String
}

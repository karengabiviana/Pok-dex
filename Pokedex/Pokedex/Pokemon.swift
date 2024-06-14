//
//  Pokemon.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 14/06/24.
//

import SwiftUI
import Combine

struct Pokemon {
    let id: Int
    let name: String
    let sprites: PokemonSprites
    let types: [PokemonTypeEntry]
    let height: Int
    let weight: Int
}

struct PokemonSprites {
    let front_default: String?
}

struct PokemonTypeEntry {
    let slot: Int
    let type: PokemonType
}

struct PokemonType {
    let name: String
}

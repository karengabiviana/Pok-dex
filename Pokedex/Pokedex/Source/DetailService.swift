//
//  DetailsService.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 18/07/24.
//

import UIKit

protocol DetailServiceProtocol {
    func getPokemonDetails(index: String, callback: @escaping (Result<Pokemon, DetailServiceError>) -> Void)
}

enum DetailServiceError: Error {
    case invalidURL
    case network(Error?)
    case invalidResponse(Error)
}

class DetailService: DetailServiceProtocol {
    func getPokemonDetails(index: String, callback: @escaping (Result<Pokemon, DetailServiceError>) -> Void) {
        let baseURL = "https://pokeapi.co/api/v2/pokemon/"
        let path = "\(index)/"
        guard let url = URL(string: baseURL + path) else {
            callback(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                callback(.failure(.network(error)))
                return
            }
            
            do {
                let json = try JSONDecoder().decode(Pokemon.self, from: data)
                callback(.success(json))
            } catch {
                callback(.failure(.invalidResponse(error)))
            }
        }
        
        task.resume()
    }
}

//
//  Service.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 14/06/24.
//

import Foundation

enum ServiceError: Error {
    case invalidURL
    case network(Error?)
    case invalidResponse(Error)
}

class Service {
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    func get(pokemonName: String, callback: @escaping (Result<Pokemon, ServiceError>) -> Void) {
        let path = "\(pokemonName)/"
        
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

//
//  Service.swift
//  Pokedex
//
//  Created by Karen Gabrieli Viana on 13/06/24.
//

import UIKit

protocol ListServiceProtocol {
    func getPokemonList(completion: @escaping (Result<[PokemonSummary], ListServiceError>) -> Void)
}

enum ListServiceError: Error {
    case invalidURL
    case network(Error?)
    case invalidResponse(Error)
}

class ListService: ListServiceProtocol {
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    func getPokemonList(completion: @escaping (Result<[PokemonSummary], ListServiceError>) -> Void) {
        var components = URLComponents(string: baseURL)
        components?.queryItems = [.init(name: "offset", value: "0"), .init(name: "limit", value: "151")]
        
        guard let url = components?.url else {
            completion(.failure(.invalidURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.network(error)))
                return
            }
            
            do {
                let list = try JSONDecoder().decode(List.self, from: data)
                completion(.success(list.results))
            } catch {
                completion(.failure(.invalidResponse(error)))
            }
        }
        
        task.resume()
    }
}


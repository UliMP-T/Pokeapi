//
//  PokeApi.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/9/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire

class PokeApi {
    static func getPokemon(name: String, completion: @escaping (Pokemon) -> Void) {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon/\(name)").responseObject { (response: DataResponse<Pokemon>) in
            if response.result.isSuccess {
                if let pokemon = response.result.value {
                    debugPrint(pokemon)
                    completion(pokemon)
                }
            } else {
                if let error = response.result.error {
                    debugPrint(error)
                }
            }
        }
    }
    
    static func getPokemonList(limit: Int, completion: @escaping (PokemonList) -> Void) {
        Alamofire.request("https://pokeapi.co/api/v2/pokemon?limit=\(limit)").responseObject { (response: DataResponse<PokemonList>) in
            if response.result.isSuccess {
                if let pokemonList = response.result.value {
                    debugPrint(pokemonList)
                    completion(pokemonList)
                }
            } else {
                if let error = response.result.error {
                    debugPrint(error)
                }
            }
        }
    }
}

//
//  PokemonResult.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/9/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import ObjectMapper

class PokemonList: Mappable {
    
    var count: Int?
    var results = [PokemonResult]()
    
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        count <- map["count"]
        results <- map["results"]
    }
    class PokemonResult: Mappable{
        var name: String?
        var url: String?
        
        required init?(map: Map) {
            
        }
        func mapping(map: Map) {
            
            name <- map["name"]
            url <- map["url"]
        }
    }
    
}

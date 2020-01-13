//
//  Pokemon.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/6/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import ObjectMapper

class Pokemon: Mappable {
    var id: Int?
    var name: String?
    var order: Int?
    var height: Int?
    var weight: Int?
    var baseExperience: Int?
    
    var sprites: Sprite?
    var types = [TypeSlot]()
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        order <- map["order"]
        height <- map["height"]
        weight <- map["weight"]
        types <- map["types"]
        baseExperience <- map["base_experience"]
        sprites <- map["sprites"]
    }
    
    class Sprite: Mappable {
        var front: String?
        var back: String?
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            front <- map["front_default"]
            back <- map["back_default"]
        }
    }
    
    class TypeSlot: Mappable {
        var slot: Int?
        var type: PokemonType?
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            slot <- map["slot"]
            type <- map["type"]
        }
    }
    
    class PokemonType: Mappable {
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

//
//  PokemonJson.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/6/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

public enum PokemonImageApi : URLrecuestConvertible
{
    enum constants {
        static let baseURLPath = "http://pokeapi.co/"
        static let authenticationToken = "Basic xxx"
    }
    case content
    case tags(String)
    case colors(String)
    
    var method: HTTPMethod{
        switch self {
        case .content:
            return .post            <#code#>
        case .tags, .colors
            return .get
            
        }
        
    }
    var path: String {
      switch self {
      case .content:
        return "/content"
      case .tags:
        return "/tagging"
      case .colors:
        return "/colors"
      }
    }
        
}

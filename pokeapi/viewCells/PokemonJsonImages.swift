//
//  PokemonJsonImages.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/7/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire

struct poke {
    let id: Int
    let name: String
    let type: String
    let stats: Int
    let link: String
    let imageUrl: String
    
    init(json:[String:Any]) {
        id = json["id"] as? Int ?? -1
        name = json["name"] as? String ?? ""
        type = json["type"] as? String ?? ""
        stats = json["stats"] as? Int ?? -1
        link = json["link"] as? String ?? ""
        imageUrl = json["imageUrl"] as? String ?? ""
        
    }
}
class PokemonJsonImages:UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonUrlString = "https://pokeapi.co/api/v2/pokemon/ditto/"
        
        guard let url = URL(string: jsonUrlString) else
        {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else {return}

//            let dataAsString = String (data: data, encoding: .utf8)
//          print(dataAsString!)
            do {
                let websiteDescription = JSONDecoder().decode(WebsiteDescription, self, from: data)
                //guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                
                //let poke = Poke(json: json)
                print(Poke)
                
            
            } catch let jsonErr{
                    print ("Error", jsonErr)
            }
            
            
        }.resume()
        
    }
}

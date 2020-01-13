//
//  DetailViewController.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/6/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var lblName: UILabel!
    
    var pokemon: Pokemon? = nil
    
    override func viewDidLoad() {
        if let pokemon = pokemon {
            lblName.text = pokemon.name
            
            pokemon.types.forEach{ typeSlot in
                debugPrint(typeSlot.type?.name)
            }
        }
    }
}

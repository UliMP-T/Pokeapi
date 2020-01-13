//
//  PokemonsViewController.swift
//  pokeapi
//
//  Created by Torque Studio on 03/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class PokemonsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        debugPrint("Carga de view controller")
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRn8qKLy7thIcCy0fFMyHep23H5gKNnIHjUbHaKgcb2XmfSdm9h")
        imageView.kf.setImage(with: url)
        
    }

}

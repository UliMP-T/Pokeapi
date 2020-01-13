//
//  AboutVC.swift
//  pokeapi
//
//  Created by Torque Studio on 03/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class AboutVC: UIViewController {
    
    
    @IBOutlet weak var imageVC: UIImageView!
    
    override func viewDidLoad() {
        debugPrint("Icon")
        let url = URL(string:
            "https://pngimg.com/uploads/pokeball/pokeball_PNG22.png")
        imageVC.kf.setImage(with: url)
    }
    
}

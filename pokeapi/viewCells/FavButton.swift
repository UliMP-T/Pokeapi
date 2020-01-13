//
//  FavButton.swift
//  pokeapi
//
//  Created by Torque Studio on 10/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit

class FavButton: UICollectionViewCell{

 override init (style: UICollectionViewCell, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    let starButton = UIButton(type: .system)
    starButton.setTitle("SOME TITLE", for: .normal)
    starButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)

    
    
}

required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}

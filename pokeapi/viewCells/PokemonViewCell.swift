//
//  CollectionViewCell.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/6/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import UIKit
import Kingfisher
import Alamofire

protocol PokemonDelegate {
    func onPokemonSelected(pokemon: Pokemon)
    func onFavoriteSelected(pokemon: Pokemon)
}

class PokemonViewCell: UICollectionViewCell {
    
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var ivSprite: UIImageView!
    @IBOutlet weak var UIFavButton: UIButton!
    
    static let reuseIdentifier = "PokemonViewCell"
    var delegate: PokemonDelegate? = nil
    var pokemon : Pokemon? = nil
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PokemonViewCell.openDetail))
        
        gesture.numberOfTapsRequired = 1
        viewContainer?.isUserInteractionEnabled = true
        viewContainer?.addGestureRecognizer(gesture)        
    }
    
    @objc func openDetail(){
        if let delegate = delegate {
            delegate.onPokemonSelected(pokemon: pokemon!)
        }
    }
}

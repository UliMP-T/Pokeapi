//
//  PokeSearch.swift
//  pokeapi
//
//  Created by Torque Studio on 03/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import Kingfisher

class PokemonsViewController: UIViewController, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    var jsonArray: NSArray?
    var nameArray: Array<String> = []
    var imageURLArray: Array<String> = []
    
    
    private let sectionInsets = UIEdgeInsets(top:50.0, left:20.0, bottom: 50.0, right: 20.0)
    private var pokemons = [Pokemon]()
    private var selectedPokemon: Pokemon! = nil
    private let itemsPerRow: CGFloat = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        let nib = UINib(nibName: "pokemonCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: PokemonViewCell.reuseIdentifier)

        loadPokemons(150)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailViewController
        vc.pokemon = selectedPokemon!
    }
    
    func loadPokemons(_ limit: Int) {
        PokeApi.getPokemonList(limit: limit){ list in
            list.results.forEach{ result in
                PokeApi.getPokemon(name: result.name!) { pokemon in
                    self.pokemons.append(pokemon)
                    self.collectionView.reloadData()
                    
                    
                    
                }
            }
        }
    }
}

extension PokemonsViewController {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pokemon = pokemons[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonViewCell.reuseIdentifier, for: indexPath) as! PokemonViewCell
        
        cell.pokemon = pokemon
        cell.delegate = self
        
        cell.lblName.text = pokemon.name
        let spriteUrl = URL(string: (pokemon.sprites?.front)!)
        cell.ivSprite.kf.setImage(with: spriteUrl)
        
//        switch pokemon.type[0] {
//        case <#pattern#>:
//            cell.viewContainer.setGradientBackground(colorTop: .red, colorBottom: .green)
//
//        default:
//            <#code#>
//        }
        

        
        return cell
    }
}

extension PokemonsViewController : UICollectionViewDelegateFlowLayout {
    
    //collectionView
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width / itemsPerRow) - 30
        return CGSize(width: width, height: 180)
    }
    
}

extension PokemonsViewController: PokemonDelegate {
    func onFavoriteSelected(pokemon: Pokemon) {
        
    }
    
    func onPokemonSelected(pokemon: Pokemon) {
        debugPrint(pokemon.name)
        selectedPokemon = pokemon
        performSegue(withIdentifier: "detailSegue", sender: self)
    }
    
    
}


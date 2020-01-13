//
//  ViewController.swift
//  pokeapi
//
//  Created by Torque Studio on 10/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import UIKit

class ViewController : UIViewController {
    
  fileprivate let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.backgroundColor = .white
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant:  40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  40).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  40).isActive = true
        collectionView.heightAnchor.constraint(equalTo: collectionView.heightAnchor, multiplier: 0.5).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.5, height: collectionView.frame.width/2)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
 
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
}

class CustomCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

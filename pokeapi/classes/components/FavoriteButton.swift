//
//  FavoriteButton.swift
//  pokeapi
//
//  Created by Torque Studio on 10/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import UIKit

class FavoriteButton: UIButton {
    
    var isActivate = false
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initButton()
    }
    
    func initButton(){
        layer.borderWidth = 2.0
        layer.borderColor = UIColor( red: 153/255, green: 153/255, blue:0/255, alpha: 1.0 ).cgColor
        layer.cornerRadius = frame.size.height/2
        
        setTitleColor(.red, for: .normal)
        addTarget(self, action: #selector(FavoriteButton.toggle), for: .touchUpInside)
    }
    
    @objc func toggle(){
        isActivate = !isActivate
        
        let color = isActivate ? UIColor.yellow : UIColor.blue
        let title = isActivate ? "favorite" : ""
        let titleColor = isActivate ? UIColor.yellow : UIColor.blue
        
        setTitleColor(color, for: .normal)
        
    }
}

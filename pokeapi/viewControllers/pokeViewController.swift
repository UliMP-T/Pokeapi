//
//  pokeViewController.swift
//  pokeapi
//
//  Created by Torque Studio on 03/01/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import UIKit
import SwiftUI
import Kingfisher

class pokeViewController:  {
    
    
struct ContentView : View {
    var body:some View {
    List {
        ForEach(0..<5) {_ in
            HStack{
                ForEach(0..<2) { _in
                    image("")
                    .resizable()
                    .scaledToFit()
                    }
                }
            }
        }
    }
}
#if DEBUG
struct contentView_Previews :PreviewProvider {
    static var previews: some View{
        ContentView()
    }
}
#endif
}

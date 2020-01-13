//
//  ImagePickerController.swift
//  pokeapi
//
//  Created by Torque Studio 3 on 1/6/20.
//  Copyright © 2020 Torque Studio. All rights reserved.
//

import Foundation
import Alamofire

takePictureButton.isHidden = true
progressView.progress = 0.0
progressView.isHidden = false
activityIndicatorView.startAnimating()

upload(image: image,
       progressCompletion: { [weak self] percent in

        self?.progressView.setProgress(percent, animated: true)
  },
       completion: { [weak self] tags, colors in

        self?.takePictureButton.isHidden = false
        self?.progressView.isHidden = true
        self?.activityIndicatorView.stopAnimating()
            
        self?.tags = tags
        self?.colors = colors
            
        self?.performSegue(withIdentifier: "ShowResults", sender: self)
}
)

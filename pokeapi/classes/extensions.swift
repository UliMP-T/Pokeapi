//
//  extensions.swift
//
//  Created by Adrian Martinez on 1/3/20.
//

import Foundation
import UIKit

extension UIView {
    
    func roundedCorners(top: Bool){
        let corners:UIRectCorner = (top ? [.topLeft , .topRight] : [.bottomRight , .bottomLeft])
        let maskPAth1 = UIBezierPath(roundedRect: self.bounds,
                                     
                                     byRoundingCorners: corners,
                                     
                                     cornerRadii:CGSize(width:12.0, height:12.0))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = self.bounds
        maskLayer1.path = maskPAth1.cgPath
        self.layer.mask = maskLayer1
    }
    
    func dashedBorderWith(color:CGColor){
    
        let  borderLayer = CAShapeLayer()
        borderLayer.name  = "borderLayer"
        
        let frameSize = self.bounds.size
        //        let frameSize = self.frame.size
        
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        borderLayer.bounds = shapeRect
        borderLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color
        borderLayer.lineWidth=1
        borderLayer.lineJoin=CAShapeLayerLineJoin.round
        borderLayer.lineDashPattern = NSArray(array: [NSNumber(value: 8),NSNumber(value:4)]) as? [NSNumber]
        
        let path = UIBezierPath.init(roundedRect: shapeRect, cornerRadius: 0)
        borderLayer.path = path.cgPath
        self.layer.addSublayer(borderLayer)
        
    }
    
    func fadeIn() {
        
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: nil)
        
    }
    func fadeOut() {
        UIView.animate(withDuration: 0.4, delay: 0.0, options: UIView.AnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.28, green: 0.27, blue: 0.27, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.0/255.0, green: 0.0/255.0, blue: 0.0/255.0, alpha: 1.0).cgColor
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop, colorBottom]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setGradientBackground(colorTop: UIColor, colorBottom: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [ colorTop.cgColor, colorBottom.cgColor]
        gradientLayer.locations = [ 0.0, 1.0]
        gradientLayer.frame = self.bounds

        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBInspectable var borderWidth: CGFloat
        {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor
        {
        set{ self.layer.borderColor = newValue.cgColor }
        get{ return UIColor(cgColor: self.layer.borderColor!) }
    }

    @IBInspectable
    var cornerRadius: CGFloat
    {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable
    var gradientBackground: Bool
    {
        set{
            if newValue {
                self.setGradientBackground()
            }
        }
        get{ return false }
    }
    
}

//
//  gradintColor.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class gradintColor: UIView {

    
    func setBackGround( colorOne : UIColor , colortwo : UIColor) {
        
        let gradintLayer = CAGradientLayer()
        gradintLayer.frame = bounds
        gradintLayer.colors = [colorOne.cgColor , colortwo.cgColor]
        gradintLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradintLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.layer.insertSublayer(gradintLayer, at: 0)
    }
    
}
extension UIView{
    func setGradientBackGround(colorOne : UIColor , colorTwo : UIColor){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds // the layer will be the same size as my object
        gradientLayer.colors = [colorOne.cgColor,colorTwo.cgColor]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}

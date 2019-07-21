//
//  circleImage.swift
//  Galen
//
//  Created by elfakharany on 5/13/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

@IBDesignable
class circleImage: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
}

extension UIImageView {
    
    func roundedImage() {
        self.layer.cornerRadius = self.frame.size.height / 2
        self.layer.cornerRadius = self.frame.size.width / 2
//        imageView.layer.masksToBounds = true
//        imageView.layer.borderWidth = 1.5
//        imageView.layer.borderColor = UIColor.white.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1.5
        self.layer.borderColor = UIColor.white.cgColor
        self.clipsToBounds = true
    }
    
}

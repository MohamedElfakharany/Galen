//
//  roundedTF.swift
//  Galen
//
//  Created by elfakharany on 4/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit


@IBDesignable
class roundedTF: UITextField {
    
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

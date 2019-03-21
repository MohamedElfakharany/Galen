//
//  RoundedEdges.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class RoundedEdges: UIView {
    
}
extension UIView {
    func MakeRoundeEdges(_ View : UIView){
        
        View.layer.cornerRadius = View.frame.height / 2
        View.clipsToBounds = true
    }
    
    
}
extension UITextField {
    
    func addShadowToTextField(color: UIColor = UIColor.lightGray, cornerRadius: CGFloat) {
        
        self.backgroundColor = UIColor.white
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1 , height: 1)
        self.layer.shadowOpacity = 0.1
        //self.backgroundColor = .white
        
    }
}



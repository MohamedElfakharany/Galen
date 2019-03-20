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
    func MakeRoundeEdges(View : UIView){
        
        View.layer.cornerRadius = 10
        View.clipsToBounds = true
        
    }
}




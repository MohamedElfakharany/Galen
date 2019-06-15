//
//  FirstVC.swift
//  Galen
//
//  Created by elfakharany on 4/16/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HospitalFirstVC: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradBTNS()
        imageLogo.image = UIImage(named: "Logo")
        
    }
    
    
     @IBOutlet weak var Signin: UIButton!

    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = Signin.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        Signin.layer.insertSublayer(gradientLayer, at: 0)
        
        Signin.layer.cornerRadius = Signin.frame.height/2
        Signin.clipsToBounds = true
    }
}

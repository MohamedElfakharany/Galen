//
//  ViewController.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class firstVC: UIViewController{

    @IBOutlet weak var imageLogo: UIImageView!
    
    
    @IBOutlet weak var Signin: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = Signin.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        //Vertical
        //gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        //gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        
        //Horizontal
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        Signin.layer.insertSublayer(gradientLayer, at: 0)
        
        Signin.layer.cornerRadius = 10
        Signin.clipsToBounds = true
        
        imageLogo.image = UIImage(named: "logo")
        
    }
    
    
}

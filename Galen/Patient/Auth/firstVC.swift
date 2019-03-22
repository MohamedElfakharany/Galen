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
    
    @IBOutlet weak var SignUP: UIButton!
    
    @IBOutlet weak var NotNow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       gradBTNS()
        imageLogo.image = UIImage(named: "logo")
        
    }
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
        
        Signin.layer.cornerRadius = Signin.frame.height / 2
        Signin.clipsToBounds = true
        
        // Sign Up BTN
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = SignUP.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SignUP.layer.insertSublayer(gradientLayer2, at: 0)
        
        SignUP.layer.cornerRadius = SignUP.frame.height / 2
        SignUP.clipsToBounds = true
        
        // Not Now BTN
        let gradientLayer3 = CAGradientLayer()
        
        gradientLayer3.frame = NotNow.bounds
        
        gradientLayer3.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
    
        gradientLayer3.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer3.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        NotNow.layer.insertSublayer(gradientLayer3, at: 0)
        
        NotNow.layer.cornerRadius = 17.5
        NotNow.clipsToBounds = true

    }
    
}

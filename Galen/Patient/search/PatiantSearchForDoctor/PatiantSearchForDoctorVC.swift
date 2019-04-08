//
//  PatiantSearchForDoctorVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class PatiantSearchForDoctorViewController: UIViewController {
    
    //@IBOutlet weak var BtnSearchByDoctorName: UITextField!
    //@IBOutlet weak var BtnSearchByAreaAndSpeaciality: UITextField!
    
    @IBAction func BtnSearchByAreaANDSpecialty(_ sender: Any) {
    }
    @IBAction func BtnSearchByDoctorName(_ sender: Any) {
    }
    @IBOutlet weak var BtnSearchByAreaANDSpecialty: UIButton!
    @IBOutlet weak var BtnSearchByDoctorName: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnSearchByAreaANDSpecialty.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSearchByAreaANDSpecialty.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnSearchByAreaANDSpecialty.layer.cornerRadius = 17.5
        BtnSearchByAreaANDSpecialty.clipsToBounds = true
        
        // Sign Up BTN
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = BtnSearchByDoctorName.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSearchByDoctorName.layer.insertSublayer(gradientLayer2, at: 0)
        
        BtnSearchByDoctorName.layer.cornerRadius = 17.5
        BtnSearchByDoctorName.clipsToBounds = true
    }
    
}

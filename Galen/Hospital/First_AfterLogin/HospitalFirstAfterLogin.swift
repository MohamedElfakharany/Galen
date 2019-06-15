//
//  HospitalFirstAfterLogin.swift
//  Galen
//
//  Created by elfakharany on 4/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HospitalFirstAfterLogin: UIViewController {

    @IBOutlet weak var imgLogo: UIImageView!
    @IBOutlet weak var BtnOutletdefinationsAndAddtitions: UIButton!
    @IBOutlet weak var BtnOutletCreateDoctorAccount: UIButton!
    @IBOutlet weak var BtnOutletDashboard: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        gradBTNS()
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // definations And Addtitions BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnOutletdefinationsAndAddtitions.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletdefinationsAndAddtitions.layer.insertSublayer(gradientLayer, at: 0)
        
        BtnOutletdefinationsAndAddtitions.layer.cornerRadius = BtnOutletdefinationsAndAddtitions.frame.height/2
        BtnOutletdefinationsAndAddtitions.clipsToBounds = true
        
        // Create DoctorAccount BTN
        let gradientLayer2 = CAGradientLayer()
        
        gradientLayer2.frame = BtnOutletCreateDoctorAccount.bounds
        
        gradientLayer2.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer2.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer2.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletCreateDoctorAccount.layer.insertSublayer(gradientLayer2, at: 0)
        
        BtnOutletCreateDoctorAccount.layer.cornerRadius = BtnOutletCreateDoctorAccount.frame.height/2
        BtnOutletCreateDoctorAccount.clipsToBounds = true
        
        // Dashboard BTN
        let gradientLayer3 = CAGradientLayer()
        
        gradientLayer3.frame = BtnOutletDashboard.bounds
        
        gradientLayer3.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer3.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer3.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnOutletDashboard.layer.insertSublayer(gradientLayer3, at: 0)
        
        BtnOutletDashboard.layer.cornerRadius = BtnOutletDashboard.frame.height/2
        BtnOutletDashboard.clipsToBounds = true
    }
}

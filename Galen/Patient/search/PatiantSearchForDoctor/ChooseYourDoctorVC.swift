//
//  ChooseYourDoctorVC.swift
//  Galen
//
//  Created by elfakharany on 3/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ChooseYourDoctorVC: UIViewController {

    @IBOutlet weak var DoctorNameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
        gradBTNS()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "nav-search"){
            
            DoctorNameTF.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            DoctorNameTF.MakeRoundeEdges(DoctorNameTF)
            DoctorNameTF.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = MyApointmentBTN.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        MyApointmentBTN.layer.insertSublayer(gradientLayer, at: 0)
   
        MyApointmentBTN.layer.cornerRadius = 5
        MyApointmentBTN.clipsToBounds = true
    }
        
    @IBAction func backBtn (_sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var MyApointmentBTN: UIButton!
 
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

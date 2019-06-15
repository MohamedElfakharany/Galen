//
//  HospitalResetPasswordVC.swift
//  Galen
//
//  Created by elfakharany on 4/16/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HospitalResetPasswordVC: UIViewController {

    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customBackBtton()
        gradBTNS()
        imageText()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }
    
    func customBackBtton() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    @IBAction func restbutn(_ sender: Any) {
        guard let phoneNumber = phoneNumber.text, !phoneNumber.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
    }
    
    func imageText() {
        
        //patient phone number
        if let myImage = UIImage(named: "phone-call"){
            
            phoneNumber.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            phoneNumber.MakeRoundeEdges(phoneNumber)
            phoneNumber.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
    }
    @IBOutlet weak var SendBtnOutlet: UIButton!
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SendBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SendBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SendBtnOutlet.layer.cornerRadius = SendBtnOutlet.frame.height/2
        SendBtnOutlet.clipsToBounds = true
    }
    
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

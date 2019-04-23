//
//  changePasswordVC.swift
//  Galen
//
//  Created by elfakharany on 3/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class changePasswordVC: UIViewController {
    
    @IBOutlet weak var oldPasswordTxtField: UITextField!
    @IBOutlet weak var NewPasswordTxtField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        imageText()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
}
    
    func imageText() {
        
        if let myImage = UIImage(named: "password"){
            
            oldPasswordTxtField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            oldPasswordTxtField.MakeRoundeEdges(oldPasswordTxtField)
            oldPasswordTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
            oldPasswordTxtField.layer.cornerRadius = oldPasswordTxtField.frame.height/2
        }
        if let myImage = UIImage(named: "password"){
            
            NewPasswordTxtField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            NewPasswordTxtField.MakeRoundeEdges(NewPasswordTxtField)
            NewPasswordTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
            NewPasswordTxtField.layer.cornerRadius = NewPasswordTxtField.frame.height/2
        }
        
    }
    @IBAction func SendActionBtn(_ sender: Any) {
        
        guard let userName = oldPasswordTxtField.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = NewPasswordTxtField.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
    }
    
    @IBOutlet weak var sendOutletBtn: UIButton!
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = sendOutletBtn.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        sendOutletBtn.layer.insertSublayer(gradientLayer, at: 0)
        
        sendOutletBtn.layer.cornerRadius = sendOutletBtn.frame.height/2
        sendOutletBtn.clipsToBounds = true
    }
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
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

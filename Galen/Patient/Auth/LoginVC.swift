//
//  LoginVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var TxtFieldPassword: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gradBTNS()
        imageText()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    
    
    
    
    @IBAction func BtnActSignin(_ sender: Any) {
        
        
        guard let userName = TxtfieldEmail.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = TxtFieldPassword.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        API_Auth.login(email: TxtfieldEmail.text ?? "" , password: TxtFieldPassword.text ?? "") { (error: Error?, success: Bool, data) in
            if success {
                if data == "trueLogin" {
                    
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBar")
                    self.present(newViewController, animated: true, completion: nil)
                   // self.performSegue(withIdentifier: "TrueLogin", sender: nil )
                    
                }else {
                    self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                print(error)
            }
            
        }
        
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            
            TxtfieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtfieldEmail.MakeRoundeEdges(TxtfieldEmail)
           TxtfieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "password"){
            
            TxtFieldPassword.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldPassword.MakeRoundeEdges(TxtFieldPassword)
            TxtFieldPassword.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
           
        }
        
        
       
        
    }
    
    @IBOutlet weak var SignInBtnOutlet: UIButton!
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SignInBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SignInBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SignInBtnOutlet.layer.cornerRadius = 17.5
        SignInBtnOutlet.clipsToBounds = true
    }
    
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    // keybord disappair
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
        
    }
}

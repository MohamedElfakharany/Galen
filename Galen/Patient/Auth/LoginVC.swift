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
    @IBOutlet weak var BtnSignin: UIButton!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageText()
        
        
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
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                }
                //
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
            }
            
        }
        
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            
            TxtfieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "password"){
            
            TxtFieldPassword.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        
       
        
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

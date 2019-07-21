//
//  SignInVC2.swift
//  Galen
//
//  Created by elfakharany on 7/13/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SignInVC2: UIViewController {

    var iconClick : Bool!
    
    @IBOutlet weak var TxtfieldEmail: UITextField!
    
    @IBOutlet weak var TxtfieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         iconClick = true
        
    }
    
    @IBAction func showHideAction(_ sender: Any) {
        
        _ = TxtfieldPassword.text!;
        
        if(iconClick == true) {
            TxtfieldPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            TxtfieldPassword.isSecureTextEntry = true
            //  iconClick = true
            iconClick = true
        }
    }
    
    @IBAction func BtnRememberMe(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
       /* if sender.isSelected {
            sender.isSelected = false
        }else {
            sender.isSelected = true
        }*/
    }
    
    @IBAction func BtnSignIn(_ sender: Any) {
    
    }
    
    // keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

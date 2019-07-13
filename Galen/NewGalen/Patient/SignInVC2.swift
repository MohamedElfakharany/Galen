//
//  SignInVC2.swift
//  Galen
//
//  Created by elfakharany on 7/13/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SignInVC2: UIViewController {

    var iconClick : Bool!
    
    @IBOutlet weak var TxtfieldEmail: UITextField!
    
    @IBOutlet weak var TxtfieldPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
         iconClick = true
        
    }
    
    @IBAction func showHideAction(_ sender: Any) {
        
        let userPassword = TxtfieldPassword.text!;
        
        if(iconClick == true) {
            TxtfieldPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            TxtfieldPassword.isSecureTextEntry = true
            //  iconClick = true
            iconClick = true
        }
    }
    
    @IBAction func BtnRememberMe(_ sender: Any) {
        
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

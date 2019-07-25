//
//  ResetPasswordVC2.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class UpdatePasswordVC2: UIViewController {
    
    var iconClick : Bool!
    var iconClick2 : Bool!
    
    @IBOutlet weak var TxtfieldPassword: UITextField!
    
    @IBOutlet weak var TxtfieldPassConfirmation: UITextField!
    
    @IBOutlet weak var BtnSaveOutlet:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSaveOutlet.layer.cornerRadius = 5
        BtnSaveOutlet.clipsToBounds = true
        
        iconClick = true
        iconClick2 = true
        
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
        
        @IBAction func showHideAction2(_ sender: Any) {
            
            _ = TxtfieldPassConfirmation.text!;
            
            if(iconClick2 == true) {
                TxtfieldPassConfirmation.isSecureTextEntry = false
                iconClick2 = false
            } else {
                TxtfieldPassConfirmation.isSecureTextEntry = true
                iconClick2 = true
            }
        }
    
    @IBAction func BtnSave(_ sender : Any){
        
    }
    
    }

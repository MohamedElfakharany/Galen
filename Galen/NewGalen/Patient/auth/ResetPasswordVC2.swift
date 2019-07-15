//
//  ResetPasswordVC2.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ResetPasswordVC2: UIViewController {
    
    @IBOutlet weak var TxtfieldMobile: UITextField!
    @IBOutlet weak var BtnSendOutlet : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSendOutlet.layer.cornerRadius = 5
        BtnSendOutlet.clipsToBounds = true
        
    }
    
    @IBAction func BtnSend(_ sender : Any){
        
    }
    
    
}

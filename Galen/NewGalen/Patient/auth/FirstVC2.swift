//
//  FirstVC2.swift
//  Galen
//
//  Created by elfakharany on 7/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class FirstVC2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradBTNS()
        
    }
    
    @IBOutlet weak var BtnSearchNow: UIButton!
    @IBOutlet weak var BtnSignUp: UIButton!
    
    func gradBTNS() {
        // sign up Btn Outlet
        BtnSignUp.layer.cornerRadius = 5
        BtnSignUp.clipsToBounds = true
        
        // search Btn Outlet
        BtnSearchNow.layer.borderWidth = 1.5
        BtnSearchNow.layer.cornerRadius = 5
        BtnSearchNow.clipsToBounds = true
        BtnSearchNow.layer.borderColor = #colorLiteral(red: 0.5450980392, green: 0.768627451, blue: 0.2588235294, alpha: 1)
    }
}

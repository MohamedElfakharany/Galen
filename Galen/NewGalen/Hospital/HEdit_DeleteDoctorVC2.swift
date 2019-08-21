//
//  HEdit&DeleteDoctor.swift
//  Galen
//
//  Created by elfakharany on 8/20/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HEdit_DeleteDoctorVC2: UIViewController {
    @IBOutlet weak var TxtFieldDoctorCode: UITextField!
    @IBOutlet weak var TxtFieldDoctorName: UITextField!
    @IBOutlet weak var BtnShowOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnShowOutlet.layer.cornerRadius = 5
        BtnShowOutlet.clipsToBounds = true
        
    }
    @IBAction func BtnNotificationAction(_ sender: Any) {
    }
    
    @IBAction func BtnShowAction(_ sender: Any) {
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

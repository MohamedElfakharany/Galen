//
//  HDefinitionVC2.swift
//  Galen
//
//  Created by elfakharany on 8/19/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HDefinitionVC2: UIViewController {
    
    @IBOutlet weak var TxtFieldHospitalCode: UITextField!
    @IBOutlet weak var TxtFieldHospitalName: UITextField!
    @IBOutlet weak var TxtFieldHospitalAddress: UITextField!
    @IBOutlet weak var TxtFieldHospitalEmail: UITextField!
    @IBOutlet weak var TxtFieldHospitalWebSite: UITextField!
    @IBOutlet weak var TxtFieldHospitalMobile: UITextField!
    @IBOutlet weak var BtnSaveOutlet :UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        BtnSaveOutlet.layer.cornerRadius = 5
        BtnSaveOutlet.clipsToBounds = true
        

        // Do any additional setup after loading the view.
    }
    @IBAction func BtnSaveAction(_ sender: Any) {
    }
    @IBAction func BtnNotification(_ sender: Any) {
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

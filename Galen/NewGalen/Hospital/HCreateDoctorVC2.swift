//
//  HEditDoctorVC2.swift
//  Galen
//
//  Created by elfakharany on 8/20/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HCreateDoctorVC2: UIViewController {
    
    @IBOutlet weak var ImgDoc: UIImageView!
    @IBOutlet weak var TxtFieldDoctorCode: UITextField!
    @IBOutlet weak var TxtFieldDoctorArea: UITextField!
    @IBOutlet weak var TxtFieldDoctorName: UITextField!
    @IBOutlet weak var TxtFieldHospitalName: UITextField!
    @IBOutlet weak var TxtFieldDoctorSpeciality: UITextField!
    @IBOutlet weak var TxtFieldDoctorMobile: UITextField!
    @IBOutlet weak var TxtFieldDoctorPhone: UITextField!
    @IBOutlet weak var TxtFieldDoctorEmail: UITextField!
    @IBOutlet weak var TxtFieldDoctorMoney: UITextField!
    @IBOutlet weak var TxtFieldDoctorFee: UITextField!
    
    @IBOutlet weak var TxtViewDocInfo: UITextView!
    
    @IBOutlet weak var BtnCancelOutlet: UIButton!
    @IBOutlet weak var BtnSaveOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSaveOutlet.layer.cornerRadius = 5
        BtnSaveOutlet.clipsToBounds = true
        
        BtnCancelOutlet.layer.cornerRadius = 5
        BtnCancelOutlet.clipsToBounds = true
        BtnCancelOutlet.layer.borderWidth = 1
        BtnCancelOutlet.layer.borderColor = #colorLiteral(red: 0.7529411765, green: 0.2235294118, blue: 0.168627451, alpha: 1)
        
        
    }
    
    
    
    
    @IBAction func BtnSaveAction(_ sender: Any) {
    }
    
    @IBAction func BtnCancelAction(_ sender: Any) {
    }
    
    @IBAction func BtnNotification(_ sender: Any) {
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
}

//
//  doctorData.swift
//  Galen
//
//  Created by elfakharany on 4/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class hospitalDoctorData: UIViewController {

    @IBOutlet weak var ImgViewDocImg: UIImageView!
    @IBOutlet weak var LblDocCode: UILabel!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocMob: UILabel!
    @IBOutlet weak var LblDocPhone: UILabel!
    @IBOutlet weak var LblDocEmail: UILabel!
    @IBOutlet weak var LblFees: UILabel!
    @IBOutlet weak var LblDiscount: UILabel!
    @IBOutlet weak var LblDocInfo: UILabel!
    @IBOutlet weak var LblDocStatues: UILabel!
    
    var CurrentDoctor : SDoctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

      //   let imageAsData : Data = UIImagePNGRepresentation(imageAsimage)!
      //  let image = UIImage(data: data)
        
        self.ImgViewDocImg.image =  UIImage(data:  CurrentDoctor!.img)
        self.LblDiscount.text = CurrentDoctor!.discount
        self.LblDocCode.text = "\(CurrentDoctor!.code)"
        self.LblDocEmail.text = CurrentDoctor!.email
        self.LblFees.text = CurrentDoctor!.fees
        self.LblDocMob.text = CurrentDoctor!.mobile
        self.LblDocPhone.text = CurrentDoctor!.phone
        self.LblDocInfo.text = CurrentDoctor!.notes
        self.LblDocSpeciality.text = CurrentDoctor?.speciality.name
        self.LblDocStatues.text = CurrentDoctor!.status
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }
    
    
    
    @IBAction func BtnActCancel(_ sender: Any) {
    }
    
    @IBAction func BtnActSave(_ sender: Any) {
    }
    
}///ClassEnd


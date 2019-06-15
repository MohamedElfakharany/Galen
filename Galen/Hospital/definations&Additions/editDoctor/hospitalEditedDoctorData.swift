//
//  hospitalEditedDoctorData.swift
//  Galen
//
//  Created by elfakharany on 4/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class hospitalEditedDoctorData: UIViewController {

    @IBOutlet weak var ImgViewDocImg: UIImageView!
    @IBOutlet weak var LblDocCode: UILabel!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocMob: UILabel!
    @IBOutlet weak var LblDocPhone: UILabel!
    @IBOutlet weak var LblDocEmail: UILabel!
    @IBOutlet weak var LblDocFees: UILabel!
    @IBOutlet weak var LblDocDiscountCode: UILabel!
    @IBOutlet weak var LblDocNotes: UILabel!
    @IBOutlet weak var LblDocStatues: UILabel!
    
    
    var CurrentDoctor : SDoctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        LblDocMob.text          = CurrentDoctor!.mobile
        LblDocCode.text         = String(CurrentDoctor!.code)
        LblDocFees.text         = CurrentDoctor!.fees
        LblDocName.text         = CurrentDoctor!.name
        LblDocEmail.text        = CurrentDoctor!.email
        LblDocNotes.text        = CurrentDoctor!.notes
        LblDocPhone.text        = CurrentDoctor!.phone
        LblDocStatues.text      = CurrentDoctor!.status
        LblDocSpeciality.text   = CurrentDoctor!.speciality.name
        LblDocDiscountCode.text = CurrentDoctor!.discount
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    
    func DeleteDoctor(DoctorID: Int){
        
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Int] = [
            "id" : DoctorID ,
            ]
        
        Alamofire.request("http://microtec1.egytag.com/api/doctors/delete", method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.CurrentDoctor =  (resData as! SDoctor)
                    ///HandlingDoctor
                    
                }
            }
        }
        
    }
    
    @IBAction func BtnActDeleteDoc(_ sender: Any) {
        self.showAlert(title: "Delete Doctor", message: "Are You Sure You Want To Delete Doctor \(CurrentDoctor!.name)", okTitle: "Delete Any Way") { (UIAlertAction) in
            self.DeleteDoctor(DoctorID: self.CurrentDoctor!.code)
        }
    }
    
    @IBAction func BtnActEditDetails(_ sender: Any) {
        performSegue(withIdentifier: "EditDoctor", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecantlySearchedDoctor" {
            let controller = segue.destination as! HospitalDoctorEditingDetails
            controller.CurrentDoctor = self.CurrentDoctor!
        }
    }

}

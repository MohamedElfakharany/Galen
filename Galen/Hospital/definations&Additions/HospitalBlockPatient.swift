//
//  HospitalBlockPatient.swift
//  Galen
//
//  Created by elfakharany on 4/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HospitalBlockPatient: UIViewController {

    @IBOutlet weak var TxtFieldPatiantCode: UITextField!
    @IBOutlet weak var TxtFieldPatiantName: UITextField!
    
    var PataintCode : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageText()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        PataintCode = Int(TxtFieldPatiantCode.text ?? "" )
    }
    func imageText() {
        
        if let myImage = UIImage(named: "hospital-code"){
            
            TxtFieldPatiantCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldPatiantCode.MakeRoundeEdges(TxtFieldPatiantCode)
            TxtFieldPatiantCode.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "user"){
            
            TxtFieldPatiantName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldPatiantName.MakeRoundeEdges(TxtFieldPatiantName)
            TxtFieldPatiantName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
    }
    
    func DeletePatiant(PataintCode : Int){
        
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "" ,
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Int] = [
            "id" : PataintCode ,
            ]
        
        Alamofire.request("//http://microtec1.egytag.com/api/patients/delete", method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    ///handking
                }
            }
        }
    }
    
    @IBAction func BtnActBlocPatiant(_ sender: Any) {
        
        if TxtFieldPatiantCode.text == ""{
            self.showAlert(title: "Patiant Code Errot", message: "Enter Correct Patiant Code")
        }else{
            
            showAlert(title: "Delete Patiant", message: "Are You Sure You Want To Delete This Patiant ", okTitle: "Delete") { (UIAlertAction) in
                self.DeletePatiant(PataintCode: (self.PataintCode!))
            }
        }
    }
    
    @IBAction func BtnActSave(_ sender: Any) {
    }

}

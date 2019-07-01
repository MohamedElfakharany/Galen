//
//  ConfirmReservationVC.swift
//  Galen
//
//  Created by elfakharany on 3/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConfirmReservationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
   BookTicket(TicketID: 10, patientMob: "+201007589492", PatiantName: "amina", PatientEmail: "amina@gmail.com", PatiantId: 6, PatientImag: "ss")
        
    }
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    
    func BookTicket(TicketID : Int , patientMob : String , PatiantName : String , PatientEmail : String , PatiantId : Int , PatientImag : String ){
        
        let StatuesDic =
        [
        "en" : "waiting",
        "ar" : "انتظار",
        "id" : 1,
        "name" : "waiting"
            ] as [String : Any]
        
        let PatientDic = [
            "mobile": patientMob ,
            "name": PatiantName ,
            "email": PatientEmail,
            "id": PatiantId,
            "_id": "",
            "image_url": PatientImag
            ] as [String : Any]
         
        
        let StatuesJson = DicToJSON(dictionary: StatuesDic)
        let PatientJson = DicToJSON(dictionary: PatientDic)
        
        let paramaters : Parameters =  [
            "id" : 10 ,
            "status" :  StatuesJson,
            "patient" : PatientJson
        ]
        
        Alamofire.request(URLs.ticketUpdate, method: .post, parameters: paramaters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            print(response.request)
            switch response.result
            {
            case .success(let value):
                let json = JSON(value)
                do {
                    print(response)
                    let datas = try json["done"]
                    if datas == "true"{
                        print("TicketBooked")
                    }
                }catch{
                }
            case .failure(_):
                print("Failure  \(response.error)")
            }
        }
        
        
        
    }
    /////////EndFuncBookTicket
    
    func DicToJSONnoTwo(){
        
    }
    
    
    
    func DicToJSON (dictionary : Dictionary<String, Any>) -> String{
        
    if let theJSONData = try?  JSONSerialization.data(
        withJSONObject: dictionary,
        options: .prettyPrinted
    ),
        let theJSONText = String(data: theJSONData,
                             encoding: String.Encoding.ascii) {
                                print("JSON string = \n\(theJSONText)")
       return theJSONText
    }
        print("ConvertError")
          return ""
    }
}

//
//  searchToEditDoctor.swift
//  Galen
//
//  Created by elfakharany on 4/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class hospitalSearchToEditDoctor: UIViewController {

    @IBOutlet weak var TxtFieldDocCode: UITextField!
    @IBOutlet weak var TxtFieldDocName: UITextField!
    
    var ResultDoc : Doctor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    func imageText() {
        
        if let myImage = UIImage(named: "clinic-code"){
            
            TxtFieldDocCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDocCode.MakeRoundeEdges(TxtFieldDocCode)
            TxtFieldDocCode.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "doctor-speciality"){
            
            TxtFieldDocName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDocName.MakeRoundeEdges(TxtFieldDocName)
            TxtFieldDocName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
    
    func SearchForDoctor(DoctorId : Int) -> Doctor {
        
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Int] = [
            "id" : DoctorId ,
            ]
        
        Alamofire.request(URLs.viewDoctor, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.ResultDoc =  resData as? Doctor
                    ///HandlingDoctor
                }
            }
        }
        return ResultDoc!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowRecantlySearchedDoctor" {
         //   let controller = segue.destination as! hospitalEditedDoctorData
            //controller.CurrentDoctor = self.ResultDoc!
        }
    }
    
    @IBAction func BtnActViewDoc(_ sender: Any) {
        
        guard let Docid = Int(self.TxtFieldDocCode.text! ) else {
            
            return self.showAlert(title: "Wrong ID", message: "Check For Doctor ID")
        }
        SearchForDoctor(DoctorId: Docid)
    }
    

}

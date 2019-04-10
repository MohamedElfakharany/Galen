//
//  EditMyProfileVC.swift
//  Galen
//
//  Created by elfakharany on 3/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class EditMyProfileVC: UIViewController,UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate {
    
    
    @IBOutlet weak var PickerViewIC: UIPickerView!
    @IBOutlet weak var TxtViewName: UITextField!
    @IBOutlet weak var TxtViewMob: UITextField!
    @IBOutlet weak var TxtViewEmail: UITextField!
    @IBOutlet weak var TxtViewDOB: UITextField!
    @IBOutlet weak var TxtViewIC: UITextField!
    @IBOutlet weak var TxtFieldGender: UITextField!
    @IBOutlet weak var PickerViewGender: UIPickerView!
    @IBOutlet weak var BtnSave: UIButton!
    
    
    var ICsNames = [String]()
    var gender = ["male","female"]
    var VarSelectedGander=0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        PickerViewIC.delegate = self
        PickerViewGender.delegate = self
        
        PickerViewGender.isHidden = true
        PickerViewIC.isHidden = true
        
         GetInsurnaceCompany()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
}
    
    
    func GetInsurnaceCompany(){
        
        let parameters : Parameters = [
            "accessToken" : helper.getAPIToken()
        ]
        
        Alamofire.request("http://microtec1.egytag.com:30001/api/medical_insurance_companies/all", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            switch (response.result){
            case .success(let Value):
                let json = JSON(Value)
                print("json =   \(json)")
                let ICs = json["list"].arrayObject as! [[String : Any]]
                for IC in ICs {
                    if let ICName = IC["name"] {
                        self.ICsNames.append(ICName as! String)
                    }
                    print("Array OF ICsNames \(self.ICsNames)")
                }
            case .failure(_):
                print("error  = \(String(describing: response.result.error))")
            }
        }
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("insideMethod")
        if textField === self.TxtViewIC {
            print("in textfieldbegin editing")
            self.PickerViewIC.isHidden = false
            self.TxtViewIC.isHidden = true
        } else if textField === self.TxtFieldGender {
            self.PickerViewGender.isHidden = false
            self.TxtFieldGender.isHidden = true
        }
    }
    
    func imageText() {
        
        // patient name
        if let myImage = UIImage(named: "user"){
            
           TxtViewName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
           TxtViewName.MakeRoundeEdges(TxtViewName)
            TxtViewName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        //patient phone number
        if let myImage = UIImage(named: "phone-call"){
            
           TxtViewMob.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
             TxtViewMob.MakeRoundeEdges( TxtViewMob)
             TxtViewMob.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient email adress
        if let myImage = UIImage(named: "email"){
            
            TxtViewEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtViewEmail.MakeRoundeEdges(TxtViewEmail)
            TxtViewEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
       
        // patient birthday date
        if let myImage = UIImage(named: "calendar"){
            
           TxtViewDOB.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtViewDOB.MakeRoundeEdges(TxtViewDOB)
            TxtViewDOB.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient insurance companies
        if let myImage = UIImage(named: "insurance-companies"){
            
           TxtViewIC.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtViewIC.MakeRoundeEdges(TxtViewIC)
            TxtViewIC.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
    
    ///pickersFunctions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == PickerViewGender {
            return gender.count
        } else {
            return self.ICsNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == PickerViewGender {
            VarSelectedGander=row
            return gender[row]
        } else {
            VarSelectedGander=row
            return ICsNames[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == PickerViewGender {
            self.PickerViewGender.isHidden = true
            TxtFieldGender.text=gender[row];
            TxtFieldGender.isHidden = false
        } else {
            self.TxtViewIC.isHidden = false
            self.TxtViewIC.text = self.ICsNames[row];
            self.PickerViewIC.isHidden = true
        }
    }
    
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    @IBAction func ActBtnSave(_ sender: Any) {
        
        let url = URLsPatient.EditProfile
        let AccessToken = helper.getAPIToken()
        let userid = helper.getUserId()
        
        var parameters : Parameters = [
            "patient_name" : TxtViewName.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            "patient_mobile" : TxtViewMob.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            "patient_user_name" :   TxtViewEmail.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "patient_birth_date" : TxtViewDOB.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "patient_insurance" : TxtViewIC.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "accessToken": AccessToken?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            "id": userid?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            ]
        
        for (key, value) in parameters {
            let stringValue = value as! String
            if stringValue == "" {
                parameters.removeValue(forKey: key)
            }
        }
        
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            print("myresponse")
            print(response)
            switch response.result
            {
            case .failure(let error):
                
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                //print(value)
                if let user_token = json["message"]["userToken"].string {
                    //print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    
                }else {
                    // let data. = json["message"].string
                    //print(data ?? "no")
                    
                }
            }
        }
    }
}

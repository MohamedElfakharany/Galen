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
    
    var pickerView = UIPickerView()
    var ICsNames:[String] = []
    var gender:[String] = []
    var VarSelectedGander=0
    var selectedTxtField = UITextField()
    
    @IBOutlet weak var TxtViewName: UITextField!
    @IBOutlet weak var TxtViewMob: UITextField!
    @IBOutlet weak var TxtViewEmail: UITextField!
    @IBOutlet weak var TxtViewDOB: UITextField!
    @IBOutlet weak var insuranceCompanies: UITextField!
    @IBOutlet weak var ganderTxtField: UITextField!
    @IBOutlet weak var BtnSave: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gender = ["male","female"]
        ICsNames = ["egypt","cairo","alex","kfs"]
        imageText()
        gradBTNS()
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
        
        Alamofire.request(URLs.allInsuranceCompanies, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
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
    
    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            // patient Name
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
            
            insuranceCompanies.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            insuranceCompanies.MakeRoundeEdges(insuranceCompanies)
            insuranceCompanies.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient Gander
        if let myImage = UIImage(named: "gander"){
            
            ganderTxtField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            ganderTxtField.MakeRoundeEdges(ganderTxtField)
            ganderTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
    
        //pickersFunctions
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if  selectedTxtField == ganderTxtField {
            return gender.count
        } else if selectedTxtField == insuranceCompanies {
            return self.ICsNames.count
        }else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == ganderTxtField {
            VarSelectedGander=row
            return gender[row]
        } else if selectedTxtField == insuranceCompanies {
            VarSelectedGander=row
            return ICsNames[row]
        }else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  selectedTxtField == ganderTxtField {
            ganderTxtField.text = gender[row]
            self.view.endEditing(true)
        } else if selectedTxtField == insuranceCompanies {
            insuranceCompanies.text = ICsNames[row]
            self.view.endEditing(true)
        }else {
            return
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        selectedTxtField = textField
        if selectedTxtField == ganderTxtField{
            selectedTxtField.inputView = pickerView
        }else if selectedTxtField == insuranceCompanies{
            selectedTxtField.inputView  = pickerView
        }
    }

    @IBAction func ActBtnSave(_ sender: Any) {
        
        let url = URLs.editProfile
        let AccessToken = helper.getAPIToken()
        let userid = helper.getAPIToken().token ?? ""
        
        var parameters : Parameters = [
            "patient_name" : TxtViewName.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            "patient_mobile" : TxtViewMob.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            "patient_email" :   TxtViewEmail.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "patient_birth_date" : TxtViewDOB.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "patient_insurance" : insuranceCompanies.text?.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "",
            "accessToken": userid.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? "" ,
            ]
        
        for (key, value) in parameters {
            let stringValue = value as! String
            if stringValue == "" {
                parameters.removeValue(forKey: key)
            }
        }
        
        //TODO: re-enable this later
        
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseData { response in
//
//            print("myresponse")
//            print(response)
//            switch response.result
//            {
//            case .failure(let error):
//
//                print(error)
//                //self.showAlert(title: "Error", message: "\(error)")
//
//            case .success(let data):
//                let json = JSON(data)
//                //print(value)
//                if let UserData = try? JSONDecoder().decode(Client.self, from:data ){
//                    //print("user token \(user_token)")
//                    helper.saveAPIUser(User: UserData)
//
//                }else {
//                    // let data. = json["message"].string
//                    //print(data ?? "no")
//
//                }
//            }
//        }
    }
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Register BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnSave.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        BtnSave.layer.insertSublayer(gradientLayer, at: 0)
        BtnSave.layer.cornerRadius = BtnSave.frame.height/2
        BtnSave.clipsToBounds = true
        
    }
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

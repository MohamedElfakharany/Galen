//
//  hospitalDefination.swift
//  Galen
//
//  Created by elfakharany on 4/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class hospitalDefination: UIViewController , UIPickerViewDataSource , UITextFieldDelegate , UIPickerViewDelegate {
    
    var pickerView = UIPickerView()
    var VarSelectedGander=0
    var selectedTxtField = UITextField()
    
    var ICsNames = [ICsName]()
    var GovArray = [City]()
    var AreaArray = [City]()
    var SpecailityArray = [Speciality]()

    
    @IBOutlet weak var TxtFieldHospitalCode: UITextField!
    @IBOutlet weak var TxtFieldFullName: UITextField!
    @IBOutlet weak var TxtFieldAddress: UITextField!
    @IBOutlet weak var TxtFieldGovernates: UITextField!
    @IBOutlet weak var TxtFeildArea: UITextField!
    @IBOutlet weak var TxtFieldEmail: UITextField!
    @IBOutlet weak var TxtFieldWebSite: UITextField!
    @IBOutlet weak var TxtFieldPhoneNumber: UITextField!
    @IBOutlet weak var TxtFieldSpecialities: UITextField!
    @IBOutlet weak var TxtFieldInsurnaceCompany: UITextField!
    

    var ChosenGovId : Int?
    var ChosenArea : Area?
    var ChosenGov : City?
    var ChosenSpeciality : Speciality?
    
    var govPresenter: GovernoratePresenter!
    var cityPresenter: CityPresenter!
    var specialityPresenter: SpecialityPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        govPresenter = GovernoratePresenter(delegate: self)
        cityPresenter = CityPresenter(delegate: self)
        specialityPresenter = SpecialityPresenter(delegate: self)
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
        specialityPresenter.getAllSpecialities()
        govPresenter.getAllGovs()
        imageText()
    }
  
    /////////
    
    func UpdateMyHospital(){
    
    }
    
    
    ///FuncModifyHospital
    
    func ModifyHospital( id : Int ,name : String, website : String ,  specialty : Int, gov : Int ,city : Int , address : String , phone : String , email : String , insurnaceCompinies : String , completion: @escaping (_ error: Error?, _ success: Bool)->Void) {

        var parameters : Parameters = [
            "hospitalID" : id ,
            "name" : name ,
            "specialty" : specialty ,
            "gov" : gov ,
            "city" : city ,
            "address" : address ,
            "mobile" : phone ,
            "email" : email ,
            "insurnaceCompinies" : insurnaceCompinies ,
            "website" : website
        ]
        
        for par in parameters {
            if par.key == "name" || par.key == "website" || par.key == "address" || par.key == "phone" || par.key == "email" || par.key == "insurnaceCompinies"{
                let parStringValue = String(describing: par.value)
                if parStringValue.isEmpty {
                    parameters.removeValue(forKey: par.key)
                }
            }else{
                let parIntValue = par.value as? Int
                if parIntValue == 0 {
                    parameters.removeValue(forKey: par.key)
                }
            }
        }
        
        Alamofire.request(URLs.hospitalUpdate, method: .post, encoding: JSONEncoding.default, headers: nil) .responseData { response in
            switch response.result
            {
            case .success(let value):
                do {
                     let swiftyJsonVar = JSON(response.result.value!)
                    if swiftyJsonVar["done"] == true {
                    self.UpdateMyHospital()
                    }
                } catch  {
                }
            case .failure(_):
                print("Failure")
            }
        }
    }
    
    
    @IBAction func BtnActSave(_ sender: Any) {
        
        ModifyHospital( id: 20, name : TxtFieldFullName.text!
                     , website : TxtFieldWebSite.text!
            , specialty : ChosenSpeciality?.specialityID ?? 0
                     , gov : ChosenGov?.cityID ?? 0
            , city : ChosenArea?.id ?? 0
            , address : TxtFieldAddress.text ?? ""
                     , phone : TxtFieldPhoneNumber.text ?? ""
                     , email : TxtFieldEmail.text ?? ""
                     , insurnaceCompinies : TxtFieldInsurnaceCompany.text! )
            { (error: Error?, success: Bool) in
                    if success {
                        self.performSegue(withIdentifier: "ShowRecantlyCreatedHospital", sender: nil )
                    }else{
                        self.showAlert(title: "Create Hospital Failed", message: "\(String(describing: error))")
                        print(error as Any)
                    }
        
        }
    }

    func imageText() {
        
        if let myImage = UIImage(named: "clinic-code"){
            
            TxtFieldHospitalCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldHospitalCode.MakeRoundeEdges(TxtFieldHospitalCode)
            TxtFieldHospitalCode.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "hospital-code"){
            
            TxtFieldFullName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldFullName.MakeRoundeEdges(TxtFieldFullName)
            TxtFieldFullName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "locations-map"){
            
            TxtFieldAddress.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldAddress.MakeRoundeEdges(TxtFieldAddress)
            TxtFieldAddress.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFieldGovernates.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldGovernates.MakeRoundeEdges(TxtFieldGovernates)
            TxtFieldGovernates.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFeildArea.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFeildArea.MakeRoundeEdges(TxtFeildArea)
            TxtFeildArea.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "email"){
            
            TxtFieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldEmail.MakeRoundeEdges(TxtFieldEmail)
            TxtFieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "hospital-website"){
            
            TxtFieldWebSite.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldWebSite.MakeRoundeEdges(TxtFieldWebSite)
            TxtFieldWebSite.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "phone-call"){
            
            TxtFieldPhoneNumber.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldPhoneNumber.MakeRoundeEdges(TxtFieldPhoneNumber)
            TxtFieldPhoneNumber.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "hospital-specialities"){
            
            TxtFieldSpecialities.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldSpecialities.MakeRoundeEdges(TxtFieldSpecialities)
            TxtFieldSpecialities.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFieldSpecialities.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "insurance-companies"){
            
            TxtFieldInsurnaceCompany.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldInsurnaceCompany.MakeRoundeEdges(TxtFieldInsurnaceCompany)
            TxtFieldInsurnaceCompany.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFieldInsurnaceCompany.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
    ///EndModifyHospital
    
         func GetInsurnaceCompany(){
            let parameters : Parameters = [
                "accessToken" : helper.dleteAPIToken()
            ]
            
            Alamofire.request(URLs.allInsuranceCompanies, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
                switch (response.result){
                case .success(let Value):
                    let json = JSON(Value)
                    print("json =   \(json)")
                    let ICs = json["list"].arrayObject as! [[String : Any]]
                    for IC in ICs {
                        if let ICName = IC["name"] {
                            self.ICsNames.append(ICName as! ICsName)
                        }
                        print("Array OF ICsNames \(self.ICsNames)")
                    }
                case .failure(_):
                    print("error  = \(String(describing: response.result.error))")
                }
            }
        }

    /////////
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if selectedTxtField == TxtFieldSpecialities {
            return SpecailityArray.count
        } else if selectedTxtField == TxtFeildArea {
            if (self.ChosenGovId == nil ){
                return 0
            }else if selectedTxtField == TxtFieldGovernates {
                return self.GovArray.count
            }
        }else if selectedTxtField == TxtFieldInsurnaceCompany {
            return self.ICsNames.count
        }
        else {return 0}
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == TxtFieldSpecialities {
            return SpecailityArray[row].name
        } else if selectedTxtField == TxtFieldGovernates {
            if (self.ChosenGovId == nil ){
                return self.GovArray[row].name
            }else{
                return self.GovArray[row].name
            }
        } else if selectedTxtField == TxtFieldInsurnaceCompany  {
            return self.ICsNames[row].name
        } else if selectedTxtField == TxtFeildArea {
            return self.AreaArray[row].name
        }
        else {return nil }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTxtField == TxtFieldSpecialities {
            TxtFieldSpecialities.text = SpecailityArray[row].name
        } else if selectedTxtField ===  TxtFieldGovernates {
            if (self.ChosenGovId == nil ){
                TxtFieldGovernates.text = GovArray[row].name
                cityPresenter.getCitiesForGov(GovArray[row].cityID ?? 0)
            }else{
                TxtFeildArea.text = AreaArray[row].name
            }
        }else if pickerView === TxtFieldInsurnaceCompany {
            TxtFieldInsurnaceCompany.text = ICsNames[row].name
            }
        }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        selectedTxtField = textField
        if selectedTxtField == TxtFieldGovernates{
            selectedTxtField.inputView = pickerView
        }else if selectedTxtField == TxtFeildArea{
            selectedTxtField.inputView  = pickerView
        }else if selectedTxtField == TxtFieldSpecialities{
            selectedTxtField.inputView  = pickerView
        }else if selectedTxtField == TxtFieldInsurnaceCompany{
            selectedTxtField.inputView  = pickerView
            }
        }
    }



extension hospitalDefination : GovernorateDelegate {
    
    func getAllGovsDidSuccess() {
        GovArray = govPresenter.govs
    }
    
    func getAllGovsDidFail(_ message: String) {
        print(message)
    }
    
    func viewGovsDidSuccess() {}
    func viewGovsDidFail(_ message: String) {}
    
}


extension hospitalDefination : CityDelegate {
    
    func getAllCitiesDidSuccess() {}
    
    func getAllCitiesDidFail(_ message: String) {}
    
    func getCitiesForGovDidSuccess() {
        AreaArray = cityPresenter.cities
    }
    
    func getCitiesForGovDidFail(_ message: String) {
        print(message)
    }
    
}


extension hospitalDefination : SpecialityDelegate {
   
    func getAllSpecialitiesDidSuccess() {
        SpecailityArray = specialityPresenter.specialities
    }
    
    func getAllSpecialitiesDidFail(_ message: String) {
        print(message)
    }

}




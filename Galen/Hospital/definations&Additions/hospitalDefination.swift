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
    var CitiesArray = [City]()
    var AreaArray = [Area]()
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
    
    var TestCityArray =  [[String:AnyObject]]()
    var TestAreaArray =  [[String:AnyObject]]()
    var TestSpecailityArray =  [[String:AnyObject]]()
    var ChosenGovId : Int?
    var ChosenArea : Area?
    var ChosenCity : City?
    var ChosenSpeciality : Speciality?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
        Fetchspecialty()
        FetchCities()
       imageText()
    }
    
    
    //FetchSpecialities
    
    func Fetchspecialty() {
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        Alamofire.request("http://microtec1.egytag.com/api/medical_specialties/view", method: .post, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.TestSpecailityArray =  resData as! [[String:AnyObject]]
                    for NextSpecaility in self.TestSpecailityArray {
                        let ReceivedSpecaility = Speciality.init(
                            _name: NextSpecaility["name"] as! String
                            , _id: NextSpecaility["id"] as! Int )
                        self.SpecailityArray.append(ReceivedSpecaility)
                    }
                }
            }
        }
    }
    ////
    
    ///FetchCities(Governates)
    
    func FetchCities() {
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "" ,
            "Content-Type" : "application/json"
        ]
        
        Alamofire.request("http://microtec1.egytag.com/api/goves/view", method: .get, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.TestCityArray =  resData as! [[String:AnyObject]]
                    for NextCity in self.TestCityArray {
                        let ReceivedCity = City.init(
                            _name: NextCity["name"] as! String
                            , _id: NextCity["id"] as! Int )
                        self.CitiesArray.append(ReceivedCity)
                    }
                }
            }
        }
    }
    
    /////FetchAreas(Cities)
    func FetchArea(ChosenGovernateID: Int) {
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Int] = [
            "id" : ChosenGovernateID ,
            ]
        
        Alamofire.request("http://microtec1.egytag.com/api/cities/view", method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["data"].arrayObject {
                    self.TestAreaArray =  resData as! [[String:AnyObject]]
                    for NextArea in self.TestAreaArray {
                        let ReceivedArea = Area.init(
                            _name: NextArea["name"] as! String
                            , _id: NextArea["id"] as! Int )
                        self.AreaArray.append(ReceivedArea)
                    }
                }
            }
        }
    }
    /////////
    
    
    ///FuncModigyHospital
    
    func ModifyHospital( name : String, website : String ,  specialty : Speciality , gov : City , code : Int ,city : Area , address : String , phone : String , email : String , insurnaceCompinies : String , completion: @escaping (_ error: Error?, _ success: Bool)->Void) {
        
        
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Any] = [
            "name" : name ,
            "code" : code ,
            "specialty" : specialty ,
            "gov" : gov ,
            "city" : city ,
            "address" : address ,
            "phone" : phone ,
            "email" : email ,
            "insurnaceCompinies" : insurnaceCompinies ,
            "website" : website
        ]
        
        Alamofire.request("http://microtec1.egytag.com/api/hospitals/update", method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if swiftyJsonVar["data"].arrayObject != nil {
                    //HandlingJsonToSaveTheHospitalAsHospitalModel
                    //let RecivedDoctor : Doctor?
                    completion(Error.self as? Error,true)
                }
            }
        }
        
        
    }
    
    
    @IBAction func BtnActSave(_ sender: Any) {
        
        ModifyHospital( name : TxtFieldFullName.text!
                     , website : TxtFieldWebSite.text!
                     , specialty : ChosenSpeciality!
                     , gov : ChosenCity!
                     , code : Int(TxtFieldHospitalCode!.text!)!
                     , city : ChosenArea!
                     , address : TxtFieldAddress.text!
                     , phone : TxtFieldPhoneNumber.text!
                     , email : TxtFieldEmail.text!
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
            
            Alamofire.request("http://microtec1.egytag.com/api/medical_insurance_companies/all", method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { response in
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
                return self.CitiesArray.count
            }else{
                return self.AreaArray.count
            }
        }else if selectedTxtField == TxtFieldInsurnaceCompany {
            return self.ICsNames.count
        }
        else {return 0 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == TxtFieldSpecialities {
            return SpecailityArray[row].name
        } else if selectedTxtField == TxtFieldGovernates {
            if (self.ChosenGovId == nil ){
                return self.CitiesArray[row].name
            }else{
                return self.AreaArray[row].name
            }
        } else if selectedTxtField == TxtFieldInsurnaceCompany  {
            return self.ICsNames[row].name
        }
        else {return nil }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTxtField == TxtFieldSpecialities {
            TxtFieldSpecialities.text = SpecailityArray[row].name
        } else if pickerView ===  TxtFieldGovernates {
            if (self.ChosenGovId == nil ){
                TxtFieldGovernates.text = CitiesArray[row].name
                FetchArea(ChosenGovernateID: CitiesArray[row].id)
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




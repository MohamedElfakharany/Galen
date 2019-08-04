//
//  addDoctor.swift
//  Galen
//
//  Created by elfakharany on 4/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class hospitalAddDoctor: UIViewController , UIPickerViewDataSource ,UIPickerViewDelegate, UITextFieldDelegate {
    var pickerView = UIPickerView()
    var VarSelectedpicker=0
    var selectedTxtField = UITextField()
    var DocStatusPicker:[String] = []
    var DocSpecialties:[String] = []
    
    @IBOutlet weak var ImgViewDoc: UIImageView!
    @IBOutlet weak var TxtFieldDocCode: UITextField!
    @IBOutlet weak var TxtFieldDocStatus: UITextField!
    @IBOutlet weak var TxtFieldDocName: UITextField!
    @IBOutlet weak var TxtFieldHosClincName: UITextField!
    @IBOutlet weak var TxtFieldSpeciality: UITextField!
    @IBOutlet weak var TxtFieldMob: UITextField!
    @IBOutlet weak var TxtFieldPhoneNum: UITextField!
    @IBOutlet weak var TxtFeildEmail: UITextField!
    @IBOutlet weak var TxtFieldFees: UITextField!
    @IBOutlet weak var TxtFieldDiscount: UITextField!
    @IBOutlet weak var TxtViewDocInfo: UITextView!
    
    //ThisTwoNotinStoryBoardOrDesginButNeededInRequest
    @IBOutlet weak var PickerDocCityArea: UIPickerView!
    @IBOutlet weak var TxtFieldDocAdress: UITextField!
    @IBOutlet weak var TxtFieldDocCity: UITextField!
    @IBOutlet weak var TxtFieldDocArea: UITextField!
    @IBOutlet weak var TxtFieldDocNathionalId: UITextField!
    @IBOutlet weak var TxtFieldDocUserName: UITextField!
    @IBOutlet weak var TxtFieldDocPassWord: UITextField!
  
    var CitiesArray = [City]()
    var AreaArray = [Area]()
    var TestAreaArray =  [[String:AnyObject]]()
    var SpecailityArray = [Speciality]()
    var ChosenGovId : Int = 0
    var ChosenArea : Area?
    var ChosenCity : City?
    var ChosenSpeciality : Speciality?
    var ChosenDoctor : Doctor?
    
    var specialityPresenter: SpecialityPresenter!
    var govPresenter: GovernoratePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialityPresenter = SpecialityPresenter(delegate: self)
        govPresenter = GovernoratePresenter(delegate: self)
        
        DocStatusPicker = ["active","unactive"]
        DocSpecialties = ["General Surgery","Neurosurgery","Radiology","Emergency Medicine","Optometrists"]
        imageText()
       
        specialityPresenter.getAllSpecialities()
        govPresenter.viewGovs()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        }
    
    // text fields outlet
    
    func imageText() {
        
        if let myImage = UIImage(named: "clinic-code"){
            
            TxtFieldDocCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDocCode.MakeRoundeEdges(TxtFieldDocCode)
            TxtFieldDocCode.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "status"){
            
            TxtFieldDocStatus.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDocStatus.MakeRoundeEdges(TxtFieldDocStatus)
            TxtFieldDocStatus.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFieldDocStatus.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        
        if let myImage = UIImage(named: "doctor-speciality"){
            
            TxtFieldDocName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDocName.MakeRoundeEdges(TxtFieldDocName)
            TxtFieldDocName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "insurance-companies"){
            
            TxtFieldHosClincName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldHosClincName.MakeRoundeEdges(TxtFieldSpeciality)
            TxtFieldHosClincName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "hospital-specialities"){
            
            TxtFieldSpeciality.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldSpeciality.MakeRoundeEdges(TxtFieldSpeciality)
            TxtFieldSpeciality.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            TxtFieldSpeciality.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let myImage = UIImage(named: "phone-call"){
            
            TxtFieldMob.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldMob.MakeRoundeEdges(TxtFieldMob)
            TxtFieldMob.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        if let myImage = UIImage(named: "phone-call"){
            
            TxtFieldPhoneNum.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldPhoneNum.MakeRoundeEdges(TxtFieldPhoneNum)
            TxtFieldPhoneNum.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "email"){
            
            TxtFeildEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFeildEmail.MakeRoundeEdges(TxtFeildEmail)
            TxtFeildEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "fee"){
            
            TxtFieldFees.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldFees.MakeRoundeEdges(TxtFieldFees)
            TxtFieldFees.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "hospital-dis-code"){
            
            TxtFieldDiscount.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldDiscount.MakeRoundeEdges(TxtFieldDiscount)
            TxtFieldDiscount.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
        
        
        func FetchArea(ChosenGovernateID: Int) {
            let header : [String: String] = [
                "Authorization" : helper.getAPIToken().token ?? "" ,
                "Content-Type" : "application/json"
            ]
            
            let parameters : [String: Int] = [
                "id" : ChosenGovernateID ,
            ]
            
            Alamofire.request(URLs.viewCities, method: .post , parameters: parameters , encoding: JSONEncoding.default , headers: header ).responseJSON { (responseData) -> Void in
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
        
        
    
    
    func AddDoctor( name : String, nathional_id : String, active : String ,  specialty : Speciality , gov : City , city : Area , address : String , phone : String , mobile : String , whatsapp : String , email : String , notes : String ,  img : UIImage , username : String , password : String , completion: @escaping (_ error: Error?, _ success: Bool, _ data: Doctor?)->Void) {
        
        
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "" ,
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: Any] = [
            "name" : name,
            "nathional_id" : nathional_id ,
            "active" : active ,
            "specialty" : specialty ,
            "gov" : gov ,
            "city" : city ,
            "address" : address ,
            "phone" : phone ,
            "mobile" : mobile ,
            "whatsapp" : whatsapp ,
            "email" : email ,
            "notes" : notes ,
            "img" : img ,
            "username" : username ,
            "password" : password
            ]
        
        Alamofire.request(URLs.addDoctor, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if swiftyJsonVar["data"].arrayObject != nil {
                   //HandlingJsonToSaveTheDoctorAsDoctorModelAndputItInChosenDoctorVar
                    //let RecivedDoctor : Doctor
                    completion(Error.self as? Error,true,self.ChosenDoctor)
                }
            }
        }
        
        
    }
    
    @IBAction func BtnActSave(_ sender: Any) {
        
        AddDoctor( name : self.TxtFieldDocName.text!,
                  nathional_id : TxtFieldDocNathionalId.text!,
                  active : "true" ,
                  specialty : (ChosenSpeciality!) ,
                  gov : ChosenCity! ,
                  city : ChosenArea! ,
                  address : TxtFieldDocAdress.text! ,
                  phone : TxtFieldMob.text! ,
                  mobile : TxtFieldPhoneNum.text! ,
                  whatsapp : TxtFieldPhoneNum.text! ,
                  email : TxtFeildEmail.text! ,
                  notes : TxtViewDocInfo.text ,
                  img : ImgViewDoc.image! ,
                  username : TxtFeildEmail.text! ,
                  password : TxtFieldDocPassWord.text! ) { (error: Error?, success: Bool, data) in
                    if success {
                            self.performSegue(withIdentifier: "ShowRecantlyCreatedDoctor", sender: nil )
                        }else{
                        self.showAlert(title: "Create Doctor Failed", message: "\(error, "")")
                        print(error as Any)
                    }
         }
        
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "ShowRecantlyCreatedDoctor" {
          //      let controller = segue.destination as! hospitalDoctorData
             //   controller.CurrentDoctor = ChosenDoctor
            }
        }
    
        func BtnActCancel(_ sender: Any) {
    }
       ////aTreansparentButtonAboveTheImageViewToMakeAction[NotInStoryBoardYet]
        func BtnActChoseImage(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (Ximage) in
            /* get your image here */
            self.ImgViewDoc.image = Ximage
            }
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if selectedTxtField == TxtFieldDocStatus {
            return self.DocStatusPicker.count
        }else if selectedTxtField == TxtFieldSpeciality{
            return self.DocSpecialties.count
        }else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == TxtFieldDocStatus{
            VarSelectedpicker = row
            return DocStatusPicker[row]
        }else if selectedTxtField == TxtFieldSpeciality{
            VarSelectedpicker = row
            return DocSpecialties[row]
        }else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTxtField == TxtFieldDocStatus{
            TxtFieldDocStatus.text = DocStatusPicker[row]
            self.view.endEditing(true)
        }else if selectedTxtField == TxtFieldSpeciality{
            TxtFieldSpeciality.text = DocSpecialties[row]
            self.view.endEditing(true)
        }else {
            return
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        selectedTxtField = textField
        if selectedTxtField == TxtFieldDocStatus{
            selectedTxtField.inputView = pickerView
        }else if selectedTxtField == TxtFieldSpeciality {
            selectedTxtField.inputView = pickerView
        }
    }
    
}



extension hospitalAddDoctor : SpecialityDelegate {
    
    func getAllSpecialitiesDidSuccess() {
        SpecailityArray = specialityPresenter.specialities
    }
    
    func getAllSpecialitiesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }

}


extension hospitalAddDoctor: GovernorateDelegate {
    
    func getAllGovsDidSuccess() {}
    func getAllGovsDidFail(_ message: String) {}
    
    func viewGovsDidSuccess() {
        CitiesArray = govPresenter.govs
    }
    
    func viewGovsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func searchGovsDidSuccess() {}
    func searchGovsDidFail(_ message: String) {}
    
}


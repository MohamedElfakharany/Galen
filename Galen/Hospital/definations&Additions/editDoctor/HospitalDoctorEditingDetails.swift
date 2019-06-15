//
//  HospitalDoctorEditingDetails.swift
//  Galen
//
//  Created by elfakharany on 4/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class HospitalDoctorEditingDetails: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource ,UITextFieldDelegate{

    var pickerView = UIPickerView()
    var VarSelectedpicker=0
    var selectedTxtField = UITextField()
    var DocStatusPicker:[String] = []
    var DocSpecialties:[String] = []
    
    @IBOutlet weak var ImgViewDocimg: UIImageView!
    @IBOutlet weak var TxtFieldDocCode: UITextField!
    @IBOutlet weak var TxtFieldDocStatus: UITextField!
    @IBOutlet weak var PickerStatues: UIPickerView!
    @IBOutlet weak var TxtFieldDocName: UITextField!
    @IBOutlet weak var TxtFieldHosClincName: UITextField!
    @IBOutlet weak var TxtFieldSpeciality: UITextField!
    @IBOutlet weak var PickerSpeciality: UIPickerView!
    @IBOutlet weak var TxtFieldMob: UITextField!
    @IBOutlet weak var TxtFieldPhoneNum: UITextField!
    @IBOutlet weak var TxtFieldEmail: UITextField!
    @IBOutlet weak var TxtFieldFees: UITextField!
    @IBOutlet weak var TxtFieldDiscount: UITextField!
    @IBOutlet weak var TxtViewDocInfo: UITextView!
    
    var CurrentDoctor : SDoctor?
    
    var SpecailityArray = [Speciality]()
    var TestSpecailityArray =  [[String:AnyObject]]()
    var StatuesArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DocStatusPicker = ["active","unactive"]
        DocSpecialties = ["General Surgery","Neurosurgery","Radiology","Emergency Medicine","Optometrists"]
        
        imageText()
        
        // Do any additional setup after loading the view.
        
        PickerStatues.delegate = self
        PickerStatues.dataSource = self
        
        PickerSpeciality.dataSource = self
        PickerSpeciality.delegate = self
        
        PickerSpeciality.isHidden = true
        PickerStatues.isHidden = true
        
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
            
            TxtFieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            TxtFieldEmail.MakeRoundeEdges(TxtFieldEmail)
            TxtFieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
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
    
    
    func Fetchspecialty() {
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "" ,
            "Content-Type" : "application/json"
        ]
        
        Alamofire.request("http://microtec1.egytag.com/api/medical_specialties/view", method: HTTPMethod.post, encoding: JSONEncoding.default, headers: header).responseJSON { (responseData) -> Void in
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
    
    func EditDoctor(DocID : Int){
        let header : [String: String] = [
            "Authorization" : helper.getAPIToken().token ?? "",
            "Content-Type" : "application/json"
        ]
        
        let parameters : [String: String] = [
            "name" : TxtFieldDocName!.text! ,
            "active" : "active" ,
            "specialty" : TxtFieldSpeciality.text! ,
            "phone" : TxtFieldPhoneNum.text! ,
            "mobile" : TxtFieldMob.text! ,
            "email" : TxtFieldEmail.text! ,
            "notes" : TxtViewDocInfo.text ,
            "code" : TxtFieldDocCode.text! ,
            "statue" : TxtFieldDocStatus.text! ,
            "discount" : TxtFieldDiscount.text! ,
            "fees" : TxtFieldFees.text!
        ]
        
        ////////////
        print("start")
        let imageData : Data = ImgViewDocimg.image!.pngData()!
        
        Alamofire.upload(multipartFormData:{ multipartFormData in
            
            for (key, value) in parameters {
                
                let string = value
                if !string.isEmpty {
                    multipartFormData.append("\(string)".data(using: String.Encoding.utf8)!, withName: key as String)
                    print("\(key)\(value)")
                }
            }
            
            multipartFormData.append(imageData, withName: "image")
        },
                         
                         usingThreshold:UInt64.init(),
                         to:"/http://microtec1.egytag.com/api/doctors/update",
                         method:.post,
                         headers : header,
                         encodingCompletion: { encodingResult in
                            switch encodingResult {
                            case .success(let upload, _, _):
                                upload.responseJSON { response in
                                    debugPrint(response)
                                }
                            case .failure(let encodingError):
                                print(encodingError)
                            }
        })
        
        ///////////
      
    }
    
    //BtnAboveThePictureToMakeAction
    @IBAction func ActBtnEditDocPic(_ sender: Any) {
        
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
            self.ImgViewDocimg.image = image
        }
        
        
        
    }
    
    
    @IBAction func BtnActCancel(_ sender: Any) {
        
    }
    
    @IBAction func BtnActSaveEditied(_ sender: Any) {
        
        self.EditDoctor(DocID: CurrentDoctor!.code)
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField === self.TxtFieldSpeciality {
            PickerSpeciality.isHidden = false
            TxtFieldSpeciality.isEnabled = false
        }else if textField === self.TxtFieldDocStatus {
            PickerStatues.isHidden = false
            TxtFieldDocStatus.isEnabled = false
        }
    }
    
    ///pickerFunc
    
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
///EndOfPickerFunc
}

//
//  signUpVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ADCountryPicker

class signUpVC: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate ,ADCountryPickerDelegate  {
    
    var pickerView = UIPickerView()
    var ICs:[InsuranceCompany] = []
    var Govs:[City] = []
    var Cities:[City] = []
    var genders = ["Male","Female"]
    var selectedTxtField = UITextField()
    var ICIndex = Int()
    var SelectedGender = String()
    var SelectedGenderID = Int()
    var GovIndex = Int()
    var CityIndex = Int()
    var SelectedCountryName = String()
    var SelectedImageUrl = String()
    let Conpicker = ADCountryPicker()
    var govPresenter: GovernoratePresenter!
    var cityPresenter: CityPresenter!
    var insurancePresenter: InsurancePresenter!
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var emailAdress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirmation: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var insuranceCompanies: UITextField!
    @IBOutlet weak var ganderTxtField: UITextField!
    @IBOutlet weak var CountryTxtfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        gender = ["male","female"]
//        ICsNames = ["one","two","three","four","five","six"]
        
        govPresenter = GovernoratePresenter(delegate: self)
        cityPresenter = CityPresenter(delegate: self)
        insurancePresenter = InsurancePresenter(delegate: self)
        
        self.CountryTxtfield.delegate = self
        insurancePresenter.getAllCompanies()
        govPresenter.getAllGovs()
        cityPresenter.getCitiesForGov(1)
        imageText()
        imageuser.roundedImage()
        UploadImageToGetUrl(imaghe: imageuser.image ?? #imageLiteral(resourceName: "userImage"))
        gradBTNS()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        setupCountryPicker()
    }
    
    func setupCountryPicker(){
        let pickerNavigationController = UINavigationController(rootViewController: Conpicker)
        Conpicker.delegate = self
        Conpicker.showCallingCodes = true
        Conpicker.showFlags = true
        Conpicker.pickerTitle = "Select a Country"
        Conpicker.defaultCountryCode = "EG"
        Conpicker.forceDefaultCountryCode = false
        Conpicker.alphabetScrollBarTintColor = UIColor.black
        Conpicker.alphabetScrollBarBackgroundColor = UIColor.clear
        Conpicker.closeButtonTintColor = UIColor.black
        Conpicker.font = UIFont(name: "Helvetica Neue", size: 15)
        Conpicker.flagHeight = 40
        Conpicker.hidesNavigationBarWhenPresentingSearch = true
        Conpicker.searchBarBackgroundColor = UIColor.lightGray
    }
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String) {
        print(code)
        let flagImage =  Conpicker.getFlag(countryCode: code)
        self.phoneNumber.text = Conpicker.getDialCode(countryCode: code)
        self.CountryTxtfield.text = (Conpicker.getCountryName(countryCode: code))
        if  let myImage =  flagImage{
        CountryTxtfield.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            }
        Conpicker.navigationController?.popToRootViewController(animated: true)
    }
  
    
    func countryPicker(_ picker: ADCountryPicker, didSelectCountryWithName name: String, code: String, dialCode: String) {
        print(dialCode)
        let dialingCode =  picker.getDialCode(countryCode: code)
        CountryTxtfield.endEditing(true)
        
    }
    
    var picker_imag: UIImage? {
        didSet{
            guard let image = picker_imag else {return}
            imageuser.isHidden = false
            self.imageuser.image = image
        }
    }
    
    @IBAction func selectImage(_ sender: Any) {
        
        let piker = UIImagePickerController()
        piker.allowsEditing = true
        piker.sourceType = .photoLibrary
        piker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
        let actionSheet = UIAlertController(title: "Photo Source", message: "Chose A Source", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action:UIAlertAction) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                piker.sourceType = .camera
                self.present(piker, animated: true, completion: nil)
            }else {
                print("notFound")
            }
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action:UIAlertAction) in
            piker.sourceType = .photoLibrary
            self.present(piker, animated: true, completion: nil)
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
        
    }
    
    func UploadImageToGetUrl(imaghe:UIImage) {
        
        let parameters : Parameters = [:]
        let imageData = (UIImage(named: "doctor-icon"))?.jpegData(compressionQuality: 0.8)
        print("Thereisanimage\(imageData)")
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            multipartFormData.append(imageData!, withName: "PatientPicture", fileName: "ProfilePicture.png", mimeType: "image/png")
        }, to:"http://intmicrotec.neat-url.com:6566/api/upload/image/default")
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    //self.delegate?.showSuccessAlert()
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    //                        self.showSuccesAlert()
                    //self.removeImage("frame", fileExtension: "txt")
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
                }
                
            case .failure(let encodingError):
                //self.delegate?.showFailAlert()
                print(encodingError)
            }
            
        }
    }
    
    
    @IBAction func RegisterBTN(_ sender: Any) {
      
        //patient name
        guard let patientNames = patientName.text?.trimmed, !patientNames.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // patient mubile number
        guard let phoneNumbers = phoneNumber.text?.trimmed, !phoneNumbers.isEmpty else {
            let messages = NSLocalizedString("enter your phone number", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // email adress
        guard let emailAdresses = emailAdress.text?.trimmed, !emailAdresses.isEmpty else {
            let messages = NSLocalizedString("enter your email adress", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // password
        guard let passwords = password.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your Password", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // password confirmation
        guard let passwordConfirmations = passwordConfirmation.text, !passwordConfirmations.isEmpty else {
            let messages = NSLocalizedString("enter your Password Confirmation", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }

        guard  password == passwordConfirmation else {
            let messages = NSLocalizedString("Password and password confirmation are different", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        // date of birth
        guard let dateOfBirths = dateOfBirth.text, !dateOfBirths.isEmpty else {
            let messages = NSLocalizedString("enter your date Of Birth", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // insurance company
        guard let insuranceCompaniess = insuranceCompanies.text, !insuranceCompaniess.isEmpty else {
            let messages = NSLocalizedString("enter your insurance Companies", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // Select Gender
        guard let Type_TxtField = ganderTxtField.text, !Type_TxtField.isEmpty else {
            let messages = NSLocalizedString("Select Your Gender", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        if ( SelectedGender == "Male" ){
            self.SelectedGenderID = 1
        } else {
            self.SelectedGenderID = 2
        }
        
        API_Auth.SignUpPatient(
        patient_name: patientNames,
        phone_number: phoneNumbers,
        email_adress:emailAdresses,
        password: passwords,
        password_confirmation: passwordConfirmations,
        date_of_birth: dateOfBirths,
        insurance_company: ICs[ICIndex],
        Gov: Govs[GovIndex],
        City: Cities[CityIndex],
        gender: SelectedGender,
        genderID: SelectedGenderID,
        countryName: SelectedCountryName,
        image: SelectedImageUrl) {
         (error: Error?, success: Bool, data) in
            print("Done")
        }
        
        
        
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z.&_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
    //////////////// Text Fields Views ////////////////
    func imageText() {

        // patient name
        if let myImage = UIImage(named: "user"){
            
            patientName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            patientName.MakeRoundeEdges(patientName)
            patientName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        //patient country
        if let myImage = UIImage(named: "status"){
            
            CountryTxtfield.MakeRoundeEdges(CountryTxtfield)
            CountryTxtfield.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        //patient phone number
        if let myImage = UIImage(named: "phone-call"){
            
            phoneNumber.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            phoneNumber.MakeRoundeEdges(phoneNumber)
            phoneNumber.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient email address
        if let myImage = UIImage(named: "user"){
            
            emailAdress.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            emailAdress.MakeRoundeEdges(emailAdress)
            emailAdress.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient password
        if let myImage = UIImage(named: "password"){
            
            password.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            password.MakeRoundeEdges(password)
            password.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient password confirmation
        if let myImage = UIImage(named: "password"){
            
            passwordConfirmation.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            passwordConfirmation.MakeRoundeEdges(passwordConfirmation)
            passwordConfirmation.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient birthday date
        if let myImage = UIImage(named: "calendar"){
            
            dateOfBirth.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            dateOfBirth.MakeRoundeEdges(dateOfBirth)
            dateOfBirth.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient insurance companies
        if let myImage = UIImage(named: "insurance-companies"){
            
            insuranceCompanies.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            insuranceCompanies.MakeRoundeEdges(insuranceCompanies)
            insuranceCompanies.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient gander
        if let myImage = UIImage(named: "gander"){
            
            ganderTxtField.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        ganderTxtField.MakeRoundeEdges(ganderTxtField)
            ganderTxtField.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
    
    @IBAction func BackBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    @IBAction func BtnCountrySearch(_ sender: Any) {
        navigationController?.pushViewController(Conpicker, animated: true)
        
    }
    
    // Picker Views

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if  selectedTxtField == ganderTxtField {
            return genders.count
        } else if selectedTxtField == insuranceCompanies {
            return self.ICs.count
        }else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == ganderTxtField {
            return genders[row]
        } else if selectedTxtField == insuranceCompanies {
            return ICs[row].name
        }else {
            
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if  selectedTxtField == ganderTxtField {
            ganderTxtField.text = genders[row]
            self.SelectedGender = genders[row]
            self.view.endEditing(true)
        } else if selectedTxtField == insuranceCompanies {
             insuranceCompanies.text = ICs[row].name
            self.ICIndex = row
//            self.view.endEditing(true)
        }else {
            return
        }
    }
    
    // Button Outlet View
    @IBOutlet weak var RegisterBtnOutlet: UIButton!
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Register BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = RegisterBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        RegisterBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        RegisterBtnOutlet.layer.cornerRadius = RegisterBtnOutlet.frame.height/2
        RegisterBtnOutlet.clipsToBounds = true
      
        // Select Country
        
//        BtnCountrySearchOutlet.layer.cornerRadius = BtnCountrySearchOutlet.frame.height/2
//        BtnCountrySearchOutlet.clipsToBounds = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        self.Conpicker.delegate = self
        selectedTxtField = textField
        if selectedTxtField == ganderTxtField{
            selectedTxtField.inputView = pickerView
        }else if selectedTxtField == insuranceCompanies{
            selectedTxtField.inputView  = pickerView
        }else if selectedTxtField === CountryTxtfield {
            print("hamouda")
            self.navigationController?.pushViewController(Conpicker, animated: true)
        }
        
    }
    

    // keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}


extension signUpVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.picker_imag = editedImage
        }else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.picker_imag = originalImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}



extension signUpVC : GovernorateDelegate {
    
    func getAllGovsDidSuccess() {
        Govs = govPresenter.govs
    }
    
    func getAllGovsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func viewGovsDidSuccess() {}
    func viewGovsDidFail(_ message: String) {}
    
}

extension signUpVC: CityDelegate {
    
    func getAllCitiesDidSuccess() {}
    func getAllCitiesDidFail(_ message: String) {}
    
    func getCitiesForGovDidSuccess() {
        Cities = cityPresenter.cities
    }
    
    func getCitiesForGovDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}


extension signUpVC: InsuranceDelegate {
    
    func getAllCompaniesDidSuccess() {
        ICs = insurancePresenter.companies
    }
    
    func getAllCompaniesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }

}

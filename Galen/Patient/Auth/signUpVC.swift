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

class signUpVC: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate{
    
    var pickerView = UIPickerView()
    var ICsNames:[String] = []
    var gender:[String] = []
    var VarSelectedGander=0
    var selectedTxtField = UITextField()
   
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var patientCode: UITextField!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet  weak var phoneNumber: UITextField!
    @IBOutlet  weak var emailAdress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet  weak var passwordConfirmation: UITextField!
    @IBOutlet  weak var dateOfBirth: UITextField!
    @IBOutlet  weak var insuranceCompanies: UITextField!
    @IBOutlet weak var ganderTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gender = ["male","female"]
        ICsNames = ["one","two","three","four","five","six"]
       
        GetInsurnaceCompany()
        imageText()
        imageuser.roundedImage()
        gradBTNS()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
       
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
    
    func GetInsurnaceCompany(){
        /*
        //////
        API_Auth.login(email: "gaber.hosny.fci.scu@gmail.com" , password: "0663403457" ) { (error: Error?, success: Bool, data) in
            if success {
            print("FakeLoginDone")
            }else {
                self.showAlert(title: "Login Filed", message: "\(data ?? "")")
                print(error as Any)
            }
            
        }*/
        //////
        
        let parameters : Parameters = [
            "accessToken" : "8462a029bb221e63e98d2653cf985ade"
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
    
    
    @IBAction func RegisterBTN(_ sender: Any) {
        // patient code
        
        
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
        
        API_Auth.register(patient_code: patientCode.text ?? "",
                          patient_name: patientName.text ?? "",
                          phone_number: phoneNumber.text ?? "",
                          email_adress: emailAdress.text ?? "",
                          password: password.text ?? "",
                          password_confirmation: passwordConfirmation.text ?? "",
                          date_of_birth: dateOfBirth.text ?? "",
                          insurance_companies: insuranceCompanies.text ?? "",
                          gander: ganderTxtField.text ?? "",
                          image: imageuser.image ?? #imageLiteral(resourceName: "1"))    {
                            (error:Error?, success: Bool, data) in
            
        }
    }
    
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z.&_%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    
    //////////////// Text Fields Views ////////////////
    func imageText() {
        // patient code
        if let myImage = UIImage(named: "user"){
            
            patientCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            patientCode.MakeRoundeEdges(patientCode)
            patientCode.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient name
        if let myImage = UIImage(named: "user"){
            
            patientName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            patientName.MakeRoundeEdges(patientName)
            patientName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        //patient phone number
        if let myImage = UIImage(named: "phone-call"){
            
            phoneNumber.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            phoneNumber.MakeRoundeEdges(phoneNumber)
            phoneNumber.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        // patient email adress
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
    // Picker Views
    
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
            
        }
        return nil
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


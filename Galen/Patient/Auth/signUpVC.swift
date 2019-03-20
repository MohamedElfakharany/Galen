//
//  signUpVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class signUpVC: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate{
    
    var gender = ["male","female"]
    var VarSelectedGander=0
    
    @IBOutlet weak var patientCode: UITextField!
    @IBOutlet weak var patientName: UITextField!
    @IBOutlet  weak var phoneNumber: UITextField!
    @IBOutlet  weak var emailAdress: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet  weak var passwordConfirmation: UITextField!
    @IBOutlet  weak var dateOfBirth: UITextField!
    @IBOutlet  weak var insuranceCompanies: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return gender.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        VarSelectedGander=row
        return gender[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //selectedGender.text=gender[row];
    }
    
    @IBAction func RegisterBTN(_ sender: Any) {
        // patient code
        
        
        //patient name
        guard let patientNames = patientName.text, !patientNames.isEmpty else {
            let messages = NSLocalizedString("enter your name", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // patient mubile number
        guard let phoneNumbers = phoneNumber.text, !phoneNumbers.isEmpty else {
            let messages = NSLocalizedString("enter your phone number", comment: "hhhh")
            let title = NSLocalizedString("Register Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        // email adress
        guard let emailAdresses = emailAdress.text, !emailAdresses.isEmpty else {
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
        // password & passwordConfirmation are equals
        guard  password == passwordConfirmation else {return}
        
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
        
        
        API_Auth.register(patient_code: patientCode.text ?? "", patient_name: patientName.text ?? "", phone_number: phoneNumber.text ?? "", email_adress: emailAdress.text ?? "", password: password.text ?? "", password_confirmation: passwordConfirmation.text ?? "", date_of_birth: dateOfBirth.text ?? "", insurance_companies: insuranceCompanies.text ?? "") { (error:Error?, success: Bool, data) in
            
            if success {
                if data == nil {
                    print("success")
                }else {
                    self.showAlert(title: "Register Filed", message: "\(data ?? "") Sorry Try again")
                }
                
            }else {
                self.showAlert(title: "Register Filed", message: "\(data ?? "") Sorry Try again")
            }
            
        }
        
        
        
    }
    
    
    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            // patient code
            patientCode.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient name
        if let myImage = UIImage(named: "user"){
            
            patientName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        //patient phone number
        if let myImage = UIImage(named: "phone-call"){
            
            phoneNumber.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient email adress
        if let myImage = UIImage(named: "email"){
            
            emailAdress.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient password
        if let myImage = UIImage(named: "password"){
            
            password.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient password confirmation
        if let myImage = UIImage(named: "password"){
            
            passwordConfirmation.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient birthday date
        if let myImage = UIImage(named: "calendar"){
            
            dateOfBirth.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        // patient insurance companies
        if let myImage = UIImage(named: "insurance-companies"){
            
            insuranceCompanies.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
   // @IBOutlet weak var pickYourType: UIPickerView!
    
    @IBAction func BackBTN(_ sender: Any) {
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

//
//  SignUpVC2.swift
//  Galen
//
//  Created by elfakharany on 7/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpVC2: UIViewController , UITextFieldDelegate{
    
    @IBOutlet weak var imageuser: UIImageView!
    @IBOutlet weak var TxtfieldCode: UITextField!
    @IBOutlet weak var TxtfieldName: UITextField!
    @IBOutlet weak var TxtfieldMobile: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    @IBOutlet weak var TxtfieldPassword: UITextField!
    @IBOutlet weak var TxtfieldPassConfirmation: UITextField!
    @IBOutlet weak var TxtfieldInsuranceCompanies: UITextField!
    @IBOutlet weak var TxtfieldBirthDay: UITextField!
    @IBOutlet weak var RegisterBtnOutlet: UIButton!
    @IBOutlet weak var countryTextField: UITextField!
    
    
    var iconClick : Bool!
    var iconClick2 : Bool!
    private var datePicker : UIDatePicker?
    var presenter: RegisterPresenter!
    var countryPicker = UIPickerView()
    let countries = ["السعودية", "مصر"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = RegisterPresenter(delegate: self)
        
        RegisterBtnOutlet.layer.cornerRadius = 5
        RegisterBtnOutlet.clipsToBounds = true
        
        UINavigationBar.appearance().barTintColor = .init(red: 13.0/255, green: 197.0/255, blue: 183.0/255, alpha: 1.0)
        UINavigationBar.appearance().isTranslucent = false
        
        imageuser.roundedImage()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SignUpVC2.dateChanged(datePicker:)), for: .valueChanged)
        TxtfieldBirthDay.inputView = datePicker
        
        iconClick = true
        iconClick2 = true
        
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryTextField.inputView = countryPicker
    }
    
    @IBAction func selectImage(_ sender: Any) {
        
        let piker = UIImagePickerController()
        piker.allowsEditing = true
        piker.sourceType = .photoLibrary
        piker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        
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
    
    @IBAction func BtnSignUp(_ sender: Any) {
        if TxtfieldName.text!.isEmpty {
            showAlert(title: "Error", message: "Please enter your name")
        } else if TxtfieldMobile.text!.count < 10 {
            showAlert(title: "Error", message: "Please enter a correct mobile number")
        } else if TxtfieldEmail.text!.count < 10 {
            showAlert(title: "Error", message: "Please enter a correct email")
        } else if TxtfieldPassword.text!.count < 6 {
            showAlert(title: "Error", message: "Password must be 6 charachters at least")
        } else if TxtfieldPassword.text != TxtfieldPassConfirmation.text {
            showAlert(title: "Error", message: "Passwords doesn't match")
        } else if countryTextField.text!.isEmpty {
            showAlert(title: "Error", message: "Please chose your country first")
        } else {
            presenter.registerNewPatient(name: TxtfieldName.text!, mobile: TxtfieldMobile.text!, username: TxtfieldEmail.text!, password: TxtfieldPassword.text!)
        }
    }
    
    
    @IBAction func showHideAction(_ sender: Any) {
        
        _ = TxtfieldPassword.text!;
        
        if(iconClick == true) {
            TxtfieldPassword.isSecureTextEntry = false
            iconClick = false
        } else {
            TxtfieldPassword.isSecureTextEntry = true
          //  iconClick = true
              iconClick = true
        }
    }
    
    @IBAction func showHideAction2(_ sender: Any) {
        
        _ = TxtfieldPassConfirmation.text!;
        
        if(iconClick2 == true) {
            TxtfieldPassConfirmation.isSecureTextEntry = false
            iconClick2 = false
        } else {
            TxtfieldPassConfirmation.isSecureTextEntry = true
            iconClick2 = true
        }
    }
    
    @IBAction func BtnMale(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    @IBAction func BtnFemale(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateForamatter = DateFormatter()
        dateForamatter.dateFormat = "MM-dd-yyyy"
        TxtfieldBirthDay.text = dateForamatter.string(from: datePicker.date)
        //        view.endEditing(true)
    }
    
    
    // keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "openChoseInsurance" {
            if let vc = segue.destination as? AuthInsuranceCompaniesVC2 {
                vc.delegate = self
            }
        } else if segue.identifier == "openChoseCountry" {
            if let vc = segue.destination as? AuthSelectCountryVC2 {
                vc.delegate = self
            }
        } else if segue.identifier == "openChoseGov" {
            if let vc = segue.destination as? AuthSelectGovsVC2 {
                vc.delegate = self
            }
        } else if segue.identifier == "openChoseArea" {
            if let vc = segue.destination as? AuthSelectAreaVC2 {
                vc.delegate = self
            }
        }
    }
    
}



extension SignUpVC2 : RegisterDelegate {
    
    func registerNewPatientDidSuccess() {
        let tabbar = self.storyboard?.instantiateViewController(withIdentifier: "mainPatientTabbar")
        navigationController?.pushViewController(tabbar!, animated: true)
    }
    
    func registerNewPatientDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}


extension SignUpVC2: UIPickerViewDelegate ,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryTextField.text = countries[row]
        self.view.endEditing(true)
    }
}





///for opening 4 different screens(chose country, gov, area, insurance), hidden for now..

protocol signUpDelegate: class {
    func didChoseInsurance(company: InsuranceCompany, controller: UIViewController)
    func didChoseGov(gov: City, controller: UIViewController)
    func didChoseArea(area: Area, controller: UIViewController)
    func didChoseCountry(country: City, controller: UIViewController)
}

extension SignUpVC2 : signUpDelegate {
    
    func didChoseInsurance(company: InsuranceCompany, controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func didChoseGov(gov: City, controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func didChoseArea(area: Area, controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    func didChoseCountry(country: City, controller: UIViewController) {
        controller.navigationController?.popViewController(animated: true)
    }
    
    
}

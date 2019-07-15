//
//  SignUpVC2.swift
//  Galen
//
//  Created by elfakharany on 7/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SignUpVC2: UIViewController {

    @IBOutlet weak var TxtfieldCode: UITextField!
    
    @IBOutlet weak var TxtfieldName: UITextField!
    
    @IBOutlet weak var TxtfieldMobile: UITextField!
    
    @IBOutlet weak var TxtfieldEmail: UITextField!
    
    @IBOutlet weak var TxtfieldPassword: UITextField!
    
    @IBOutlet weak var TxtfieldPassConfirmation: UITextField!
    
    @IBOutlet weak var TxtfieldInsuranceCompanies: UITextField!
    
    @IBOutlet weak var TxtfieldBirthDay: UITextField!

    @IBOutlet weak var RegisterBtnOutlet: UIButton!
    
    var iconClick : Bool!
    var iconClick2 : Bool!
    private var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SignUpVC2.dateChanged(datePicker:)), for: .valueChanged)
        TxtfieldBirthDay.inputView = datePicker
        
        iconClick = true
        iconClick2 = true
        imageText()
    }
    
    func imageText() {
        
        // patient name
        if let myImage = UIImage(named: "chevronLeft"){
            
            TxtfieldInsuranceCompanies.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    @IBAction func BtnSignUp(_ sender: Any) {
        
    }
    
    @IBAction func showHideAction(_ sender: Any) {
        
        let userPassword = TxtfieldPassword.text!;
        
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
        
        let userPassword = TxtfieldPassConfirmation.text!;
        
        if(iconClick2 == true) {
            TxtfieldPassConfirmation.isSecureTextEntry = false
            iconClick2 = false
        } else {
            TxtfieldPassConfirmation.isSecureTextEntry = true
            iconClick2 = true
        }
    }
    /*
     @IBAction func BtnRememberMe(_ sender: UIButton) {
     
     UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear
     , animations: {
     sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
     }) { (success) in
     sender.isSelected = !sender.isSelected
     UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
     sender.transform = .identity
     }, completion: nil)
     }
     */
    @IBAction func BtnMale(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    @IBAction func BtnFemale(_ sender: UIButton) {
        UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .curveLinear, animations: {
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
}

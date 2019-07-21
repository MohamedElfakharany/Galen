//
//  SignUpVC2.swift
//  Galen
//
//  Created by elfakharany on 7/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class SignUpVC2: UIViewController ,UIPickerViewDelegate, UITextFieldDelegate{
    
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
    
    var iconClick : Bool!
    var iconClick2 : Bool!
    private var datePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().barTintColor = .init(red: 13.0/255, green: 197.0/255, blue: 183.0/255, alpha: 1.0)
        UINavigationBar.appearance().isTranslucent = false
        
        imageuser.roundedImage()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(SignUpVC2.dateChanged(datePicker:)), for: .valueChanged)
        TxtfieldBirthDay.inputView = datePicker
        
        iconClick = true
        iconClick2 = true
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
}

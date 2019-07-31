//
//  LoginVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class LoginVC: UIViewController {

    @IBOutlet weak var TxtFieldPassword: UITextField!
    @IBOutlet weak var TxtfieldEmail: UITextField!
    
    var userPresenter: UserPresenter!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        userPresenter = UserPresenter(delegate: self)
        imageText()
        gradBTNS()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    @IBAction func BtnActSignin(_ sender: Any) {
        
        guard let userName = TxtfieldEmail.text, !userName.isEmpty else {
            let messages = NSLocalizedString("enter your Email", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        guard let passwords = TxtFieldPassword.text, !passwords.isEmpty else {
            let messages = NSLocalizedString("enter your password", comment: "hhhh")
            let title = NSLocalizedString("Login Filed", comment: "hhhh")
            self.showAlert(title: title, message: messages)
            return
        }
        
        userPresenter.login(email: TxtfieldEmail.text ?? "", password: TxtFieldPassword.text ?? "")
    }

    

    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            
            TxtfieldEmail.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtfieldEmail.MakeRoundeEdges(TxtfieldEmail)
           TxtfieldEmail.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "password"){
            
            TxtFieldPassword.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldPassword.MakeRoundeEdges(TxtFieldPassword)
            TxtFieldPassword.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
           
        }
    }//EndImageText
    
    @IBOutlet weak var SignInBtnOutlet: UIButton!
    
    func gradBTNS() {
        
        let RightGradientColor =  #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)
        let LiftGradientColor =  #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = SignInBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        SignInBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        SignInBtnOutlet.layer.cornerRadius = 17.5
        SignInBtnOutlet.clipsToBounds = true
    }//EndGrad
    
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }//ENDBack
    
    // keybord disappair
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }//EndDisappair
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
        
    }//EndShouldReturn

}


extension LoginVC : UserDelegate {
    
    func loginDidSuccess() {
        
        //TODO: response user has no type in it
        
//        if user.user?.type == "doctor" {
//            let storyboard = UIStoryboard(name: "Doctor", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "DocAppoinment") as! DoctorAppoinements
//            self.present(vc, animated: true, completion: nil)
//        } else {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBar")
            self.present(newViewController, animated: true, completion: nil)
//        }
    }
    
    func loginDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func logoutDidSuccess() {}
    func logoutDidFail(_ message: String) {}
    
}

//
//  API+Auth.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class API_Auth: NSObject {
    
    class func login(email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLsPatient.login
        print(url)
        let parameters = [
            "email": email,
            "password": password
        ]
        
        print(parameters)
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["message"]["userToken"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                    let data = json["message"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }
    /*
     @IBOutlet weak var patientCode: UITextField!
     @IBOutlet weak var patientName: UITextField!
     @IBOutlet  weak var phoneNumber: UITextField!
     @IBOutlet  weak var emailAdress: UITextField!
     @IBOutlet weak var password: UITextField!
     @IBOutlet  weak var passwordConfirmation: UITextField!
     @IBOutlet  weak var dateOfBirth: UITextField!
     @IBOutlet  weak var insuranceCompanies: UITextField!
     */
    class func register(patient_code: String, patient_name: String,phone_number: String,email_adress: String, password: String,password_confirmation: String,date_of_birth: String ,insurance_companies:String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLsPatient.register+"?name=\(patient_code.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? patient_code)&email=\(patient_name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? patient_name)&phone=\(phone_number.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone_number)&password=\(email_adress.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? email_adress)&password=\(password.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password)&password=\(password_confirmation.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password_confirmation)&address=\(date_of_birth.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? date_of_birth)&address=\(insurance_companies.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? insurance_companies)"
        print(url)
        
    }
    
    class func restPassword(email: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLsPatient.restPassword
        print(url)
        let parameters = [
            "email": email
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                print(value)
                if let user_token = json["message"]["userToken"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                    let data = json["message"].string
                    print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
        }
        
    }


}

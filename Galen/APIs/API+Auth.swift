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
            print(response)
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print("the error is")
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let json = JSON(value)
                if json["error"] != "Login Error , You Are Loged " {
                    print("thereisauser")
                 print("json =   \(json)")
                if let user_token = json["accessToken"].string {
                    print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    print("loginIsDone")
                    completion(nil, true , "trueLogin")
                    }
                    
                    let user = json["user"].dictionary ?? ["nouser" : "nouser"]
                    print("theuser  \(user)")
                    
                    if let user_id: String = user["id"]?.stringValue {
                        print("user id \(user_id )")
                        helper.saveUserId(userId: user_id  )
                    }
                        print("loginIsDone")
                        completion(nil, true , "trueLogin")
                }else {
                    Alamofire.request("http://microtec1.egytag.com:30001/api/user/logout", method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
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
    class func register(patient_code: String, patient_name: String,phone_number: String,email_adress: String, password: String,password_confirmation: String,date_of_birth: String ,insurance_companies:String,gander:String , completion: @escaping (_ error: Error?, _ success: Bool, _ data: [String]?)->Void) {
        
        let url = URLsPatient.register
        /*+"patient_name=\(patient_name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? patient_name)&patient_mobile=\(phone_number.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone_number)&patient_user_name=\(email_adress.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? email_adress)&patient_password=\(password.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password)&patient_birth_date=\(date_of_birth.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? date_of_birth)&patient_insurance=\(insurance_companies.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? insurance_companies)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!*/
            
            let parameters : Parameters = [
                "patient_name" : patient_name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? patient_name ,
                "patient_mobile" : phone_number.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone_number ,
                "patient_user_name" :   email_adress.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? email_adress,
                "patient_password" :   password.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password ,
                "patient_birth_date" : date_of_birth.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? date_of_birth,
                "patient_insurance" : insurance_companies.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? insurance_companies,
                "gander" : gander.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? gander
                ]

        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseJSON { response in
            
            print("myresponse")
            print(response)
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let value):
                let data = [email_adress,password]
                let json = JSON(value)
                //print(value)
                if let user_token = json["message"]["userToken"].string {
                 //print("user token \(user_token)")
                    helper.saveAPIToken(token: user_token)
                    completion(nil, true , nil)
                }else {
                   // let data. = json["message"].string
                    //print(data ?? "no")
                    completion(nil, true, data)
                }
                
            }
    }
    
        func restPassword(email: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
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
}

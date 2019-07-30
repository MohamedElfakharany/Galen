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
    
    
//    class func APILogin(email: String, password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ accessToken: String?,_ role: String?,_ message: String?,_ done: Bool?)->Void) {
//
//        let url = URLsPatient.login
//        print(url)
//        let parameters:[String:Any] = [
//            "email": email,
//            "password": password
//        ]
//
//        print(parameters)
//        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default , headers: nil) .responseJSON { response in
//            switch response.result
//            {
//            case .failure(let error):
//                completion(error, false, nil,nil,nil,false)
//                print(error)
//            //self.showAlert(title: "Error", message: "\(error)")
//            case .success(let value):
//                let json = JSON(value)
//                print(json)
//                let status = json["done"].bool
//                if status == true {
//                    print(value)
//                    if let user_token = json["accessToken"].string , let role = json["user"]["role"].string {
//                        print("user token \(user_token)")
//                        print(role)
//                        helper.saveAPIToken(token: user_token, role: role)
//                        completion(nil, true , user_token,role,nil,status)
//                    }
//                }else {
//                    let message = json["error"].string
//                    print(message ?? "no")
//                    completion(nil, false, nil,nil,message,status)
//                }
//            }
//        }
//    }
//    func completion<Result>(onResult: @escaping (Result) -> Void, onError: @escaping (Error) -> Void) -> ((Result?, Error?) -> Void) { return { (maybeResult, maybeError) in
    class func login(email: String,password: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?,_ User : Client )->Void,completionError: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {

        let parameters = [
            "email": email,
            "password": password
        ]
        
        print(parameters)
        Alamofire.request(URLs.login, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseData { response in
            print(response)
            switch response.result
            {
            case .failure(let error):
                completionError(error, false, nil)
                print("the error is")
                print(error)
            //self.showAlert(title: "Error", message: "\(error)")
            case .success(let value):
                let json = JSON(value)
                if json["error"] != "Login Error , You Are Loged " {
                    let data = response.result.value
                    print (data as Any)
                    do {
                        let UserData = try? JSONDecoder().decode(Client.self, from:data! )
                        print("TheUSER\(UserData)" )
                        print("\(UserData?.user?.type ?? "nill")" )
                        completion(nil, true , "trueLogin",UserData!)
                    } catch {
                    }
                    
                }else{
                    Alamofire.request(URLs.logOut, method: .post, parameters: nil, encoding: URLEncoding.default, headers: nil)
                    let data = json["message"].string
                    print(data ?? "no")
                    completionError(nil, true, nil)
                }
                
            }
        }
        
    }

    
    class func SignUpPatient(
        patient_name: String
        ,phone_number: String
        ,email_adress: String
        , password: String
        ,password_confirmation: String
        ,date_of_birth: String
        ,insurance_company:InsuranceCompany
        ,Gov : City
        ,City : City
        ,gender:String
        ,genderID: Int
        ,countryName : String
        ,image: String
        , completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = "http://intmicrotec.neat-url.com:6566/api/register/add"
        
        var parameters = [
            "patient_name" :  patient_name   ,
            "patient_mobile" : phone_number  ,
            "patient_user_name" : email_adress  ,
            "patient_password" : password   ,
            "birth_date_day" : date_of_birth ,
            "gender" : [
                "name" : gender ,
                "id" : genderID
            ] , // GENDER DECT
            "insurance_company" : [
                "id": insurance_company.insurnaceCompaniesID as Any ,
                "name": insurance_company.name as Any ,
            ] ,// IC DECT
            "gov" : [
                "id" : Gov.governateID as Any,
                "name" : Gov.name as Any
            ] ,// GOV DEC
            "city" : [
                "id" : City.cityID as Any ,
                "name" : City.name as Any
            ], //CITY DEC
            "country" : [
                "name" : countryName
            ], //COUNTRY DEC
            "image_url" : image
            ]   as [String : Any]  //END PARAMETERS
        print(parameters)
    }
    
    class func register( patient_name: String,phone_number: String,email_adress: String, password: String,password_confirmation: String,date_of_birth: String ,insurance_companies:String,gander:String,image: UIImage , completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.register
        
        let parameters : Parameters = [
            "patient_name" : patient_name.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? patient_name ,
            "patient_mobile" : phone_number.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? phone_number ,
            "patient_user_name" :   email_adress.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? email_adress,
            "patient_password" :   password.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? password ,
            "patient_birth_date" : date_of_birth.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? date_of_birth,
            "patient_insurance" : insurance_companies.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? insurance_companies,
            "gander" : gander.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed) ?? gander
        ]
        Alamofire.upload(multipartFormData: { (form: MultipartFormData) in
            if let data = image.jpegData(compressionQuality: 0.5) {
                form.append(data, withName: "image", fileName: "image.jpeg", mimeType: "image/jpeg")
            }
            
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post, headers: nil) { (result: SessionManager.MultipartFormDataEncodingResult) in
            switch result {
            case .failure(let error):
                print(error)
                completion(error,false,nil)
                
            case .success(request: let upload, streamingFromDisk: _, streamFileURL: _):
                upload.uploadProgress(closure: { (progress: Progress) in
                    print("farido\(progress)")
                }
                )
                upload.responseData(completionHandler: { (response: DataResponse<Data>) in
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
                            let data = response.result.value
                            print (data as Any)
                            do {
                                let UserData = try? JSONDecoder().decode(Client.self, from:data! )
                                print("TheUSER\(UserData)" )
                                print("\(UserData?.user?.type ?? "nill")" )
                                print(UserData?.user?.role)
                                completion(nil, true , "trueLogin")
                            } catch {}
                        }
                    }
                }
            )
        }
    }
    
    func restPassword(email: String, completion: @escaping (_ error: Error?, _ success: Bool, _ data: String?)->Void) {
        
        let url = URLs.restPassword
        print(url)
        let parameters = [
            "email": email
        ]
        print(parameters)
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil) .responseData { response in
            switch response.result
            {
            case .failure(let error):
                completion(error, false, nil)
                print(error)
                //self.showAlert(title: "Error", message: "\(error)")
                
            case .success(let data):
                let json = JSON(data)
                print(data)
                if let UserData = try? JSONDecoder().decode(Client.self, from:data){
                    helper.saveAPIUser(User: UserData)
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

//
//  RegisterPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol RegisterDelegate: class {
    func registerNewPatientDidSuccess()
    func registerNewPatientDidFail(_ message: String)
}


class RegisterPresenter {
    
    weak var delegate: RegisterDelegate?
    let provider = MoyaProvider<RegisterService>()
    var user : User?
    
    
    init(delegate: RegisterDelegate) {
        self.delegate = delegate
    }
    
    func registerNewPatient(name: String, mobile: String, username: String, password: String){
        provider.request(.newPatient(name: name, mobile: mobile, username: username, password: password)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: RegisterResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.registerNewPatientDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.user = data.user
                        UserDefaults.standard.set(data.user?.userID, forKey: "savedUserID")
                        self.delegate?.registerNewPatientDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.registerNewPatientDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.registerNewPatientDidFail(error.localizedDescription)
            }
        }
    }
    

    
}

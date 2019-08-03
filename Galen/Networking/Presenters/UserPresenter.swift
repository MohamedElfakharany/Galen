//
//  UserPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol UserDelegate: class {
    func loginDidSuccess()
    func loginDidFail(_ message: String)
    func logoutDidSuccess()
    func logoutDidFail(_ message: String)
}


class UserPresenter {
    
    weak var delegate: UserDelegate?
    let provider = MoyaProvider<UserService>()
    var token : String?
    
    init(delegate: UserDelegate) {
        self.delegate = delegate
    }
    
    func login(email: String, password: String){
        provider.request(.login(email: email, password: password)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: UserResponse.self)
                    
                    if let error = data.error {
                        self.delegate?.loginDidFail(error)
                        return
                    }
                    
                    if data.done == false {
                        print("response status false")
                        self.delegate?.loginDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.token = data.accessToken
                        self.delegate?.loginDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.loginDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.loginDidFail(error.localizedDescription)
            }
        }
    }
    
    func logout(){
        provider.request(.logout) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: UserResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.logoutDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.token = nil
                        self.delegate?.logoutDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.logoutDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.logoutDidFail(error.localizedDescription)
            }
        }
    }
    
}

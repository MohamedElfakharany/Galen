//
//  DoctorPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol DoctorDelegate: class {
    func getAllDoctorsDidSuccess()
    func getAllDoctorsDidFail(_ message: String)
    func getSearchDoctorsDidSuccess()
    func getSearchDoctorsDidFail(_ message: String)
}


class DoctorPresenter {
    
    weak var delegate: DoctorDelegate?
    let provider = MoyaProvider<DoctorService>()
    var doctors = [Doctor]()
    var searchedDoctors = [Doctor]()
    
    init(delegate: DoctorDelegate) {
        self.delegate = delegate
    }
    
    func getAllDoctors(){
        provider.request(.allDoctors) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllDoctorsResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllDoctorsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.doctors = data.list ?? []
                        self.delegate?.getAllDoctorsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllDoctorsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllDoctorsDidFail(error.localizedDescription)
            }
        }
    }
    
    
    func searchDoctors(text: String){
        provider.request(.searchDoctors(text: text)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllDoctorsResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getSearchDoctorsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.searchedDoctors = data.list ?? []
                        self.delegate?.getSearchDoctorsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getSearchDoctorsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getSearchDoctorsDidFail(error.localizedDescription)
            }
        }
    }
    
}

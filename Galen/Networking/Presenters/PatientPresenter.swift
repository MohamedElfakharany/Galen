//
//  PatientPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol PatientDelegate: class {
    func getAllPatientsDidSuccess()
    func getAllPatientsDidFail(_ message: String)
}


class PatientPresenter {
    
    weak var delegate: PatientDelegate?
    let provider = MoyaProvider<PatientService>()
    var patients = [Patient]()
    
    
    init(delegate: PatientDelegate) {
        self.delegate = delegate
    }
    
    func getAllPatients(){
        provider.request(.allPatients) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllPatientsResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllPatientsDidFail("Request failed")
                    } else {
                        print("Response:")
                        dump(data)
                        self.patients = data.list ?? []
                        self.delegate?.getAllPatientsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllPatientsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllPatientsDidFail(error.localizedDescription)
            }
        }
    }

}

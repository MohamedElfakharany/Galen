//
//  SpecialityPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol SpecialityDelegate: class {
    func getAllSpecialitiesDidSuccess()
    func getAllSpecialitiesDidFail(_ message: String)
}


class SpecialityPresenter {
    
    weak var delegate: SpecialityDelegate?
    let provider = MoyaProvider<SpecialityService>()
    var specialities = [Speciality]()
    
    
    init(delegate: SpecialityDelegate) {
        self.delegate = delegate
    }
    
    func getAllSpecialities(){
        provider.request(.allSpecialities) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllSpecialitiesResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllSpecialitiesDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.specialities = data.list ?? []
                        self.delegate?.getAllSpecialitiesDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllSpecialitiesDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllSpecialitiesDidFail(error.localizedDescription)
            }
        }
    }
    
}

//
//  HospitalPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

protocol HospitalDelegate: class {
    func getAllHospitalsDidSuccess()
    func getAllHospitalsDidFail(_ message: String)
}


class HospitalPresenter {
    
    weak var delegate: HospitalDelegate?
    let provider = MoyaProvider<HospitalService>()
    var hospitals = [Hospital]()
    
    
    init(delegate: HospitalDelegate) {
        self.delegate = delegate
    }
    
    func getAllHospitals(params: [String: Any]?){
        provider.request(.allHospitals(params: params)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    if let data = try response.mapJSON() as? AllHospitalsResponse {
                        if data.done == false {
                            print("response status false")
                            self.delegate?.getAllHospitalsDidFail("Request failed")
                        } else {
                            print("Response:")
                            dump(data)
                            self.hospitals = data.list ?? []
                            self.delegate?.getAllHospitalsDidSuccess()
                        }
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllHospitalsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllHospitalsDidFail(error.localizedDescription)
            }
        }
    }
    
}

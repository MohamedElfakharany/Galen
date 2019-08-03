//
//  InsuranceCompanyPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol InsuranceDelegate: class {
    func getAllCompaniesDidSuccess()
    func getAllCompaniesDidFail(_ message: String)
}


class InsurancePresenter {
    
    weak var delegate: InsuranceDelegate?
    let provider = MoyaProvider<InsuranceCompanyService>()
    var companies = [InsuranceCompany]()
    
    
    init(delegate: InsuranceDelegate) {
        self.delegate = delegate
    }
    
    func getAllCompanies(){
        provider.request(.allCompanies) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllInsuranceCompaniesResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllCompaniesDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.companies = data.list ?? []
                        self.delegate?.getAllCompaniesDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllCompaniesDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllCompaniesDidFail(error.localizedDescription)
            }
        }
    }
    
}

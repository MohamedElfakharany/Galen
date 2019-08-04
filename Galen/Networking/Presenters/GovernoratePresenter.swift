//
//  GovernoratePresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol GovernorateDelegate: class {
    func getAllGovsDidSuccess()
    func getAllGovsDidFail(_ message: String)
    func viewGovsDidSuccess()
    func viewGovsDidFail(_ message: String)
    func searchGovsDidSuccess()
    func searchGovsDidFail(_ message: String)
}


class GovernoratePresenter {
    
    weak var delegate: GovernorateDelegate?
    let provider = MoyaProvider<GovernorateService>()
    var govs = [City]()
    var searchedGovs = [City]()
    
    init(delegate: GovernorateDelegate) {
        self.delegate = delegate
    }
    
    func getAllGovs(){
        provider.request(.allGovs) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllCitiesResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllGovsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.govs = data.list ?? []
                        self.delegate?.getAllGovsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllGovsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllGovsDidFail(error.localizedDescription)
            }
        }
    }
    
    func viewGovs(){
        provider.request(.viewGovs) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllCitiesResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.viewGovsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.govs = data.list ?? []
                        self.delegate?.viewGovsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.viewGovsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.viewGovsDidFail(error.localizedDescription)
            }
        }
    }
    
    
    func searchGovs(text: String){
        provider.request(.searchGovs(text: text)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllCitiesResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.searchGovsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.searchedGovs = data.list ?? []
                        self.delegate?.searchGovsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.searchGovsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.searchGovsDidFail(error.localizedDescription)
            }
        }
    }
    
}

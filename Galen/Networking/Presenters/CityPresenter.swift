//
//  CityPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

protocol CityDelegate: class {
    func getAllCitiesDidSuccess()
    func getAllCitiesDidFail(_ message: String)
    func getCitiesForGovDidSuccess()
    func getCitiesForGovDidFail(_ message: String)
}


class CityPresenter {
    
    weak var delegate: CityDelegate?
    let provider = MoyaProvider<CityService>()
    var cities = [City]()
    
    
    init(delegate: CityDelegate) {
        self.delegate = delegate
    }
    
    func getAllCities(){
        provider.request(.allCities) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    if let data = try response.mapJSON() as? AllCitiesResponse {
                        if data.done == false {
                            print("response status false")
                            self.delegate?.getAllCitiesDidFail("Request failed")
                        } else {
                            print("Response:")
                            dump(data)
                            self.cities = data.list ?? []
                            self.delegate?.getAllCitiesDidSuccess()
                        }
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllCitiesDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllCitiesDidFail(error.localizedDescription)
            }
        }
    }
    
    
    func getCitiesForGov(_ govID: Int){
        provider.request(.citiesForGov(govID: govID)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    if let data = try response.mapJSON() as? AllCitiesResponse {
                        if data.done == false {
                            print("response status false")
                            self.delegate?.getCitiesForGovDidFail("Request failed")
                        } else {
                            print("Response:")
                            dump(data)
                            self.cities = data.list ?? []
                            self.delegate?.getCitiesForGovDidSuccess()
                        }
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getCitiesForGovDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getCitiesForGovDidFail(error.localizedDescription)
            }
        }
    }
    
}

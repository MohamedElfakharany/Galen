//
//  CityService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum CityService {
    case allCities
    case citiesForGov(govID: Int)
}

extension CityService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)cities")! }
    
    
    var path: String {
        switch self {
        case .allCities, .citiesForGov:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allCities:
            return .requestPlain
        case .citiesForGov(let govID):
            return .requestParameters(parameters: [
                "where":
                    [
                    "gov.id"  : govID
                    ]
                ], encoding: JSONEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json",
                "Authorization" : helper.getAPIToken().token ?? ""]
    }
}

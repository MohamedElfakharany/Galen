//
//  HospitalService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum HospitalService {
    case allHospitals(params: [String: Any]?)
}

extension HospitalService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)hospitals")! }
    
    
    var path: String {
        switch self {
        case .allHospitals:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allHospitals(let params):
            if params != nil {
                return .requestParameters(parameters: params!, encoding: JSONEncoding.default)
            } else {
                return .requestPlain
            }
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

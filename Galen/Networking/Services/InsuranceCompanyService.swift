//
//  InsuranceCompanyService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum InsuranceCompanyService {
    case allCompanies
    case searchCompanies(text: String)
}

extension InsuranceCompanyService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)medical_insurance_companies")! }
    
    
    var path: String {
        switch self {
        case .allCompanies, .searchCompanies:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allCompanies:
            return .requestPlain
        case .searchCompanies(let text):
            return .requestParameters(parameters: ["where": ["name": text]], encoding: JSONEncoding.default)
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json",
                "Authorization" : UserDefaults.standard.string(forKey: "accessToken") ?? ""]
    }
}

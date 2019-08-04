//
//  PatientService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum PatientService {
    case allPatients
}

extension PatientService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)patients")! }
    
    
    var path: String {
        switch self {
        case .allPatients:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allPatients:
            return .requestPlain
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

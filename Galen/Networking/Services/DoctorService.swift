//
//  DoctorService.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum DoctorService {
    case allDoctors
    case searchDoctors(text: String)
}

extension DoctorService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)doctors")! }
    
    
    var path: String {
        switch self {
        case .allDoctors, .searchDoctors:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allDoctors:
            return .requestPlain
        case .searchDoctors(let text):
            return .requestParameters(parameters: ["search": text], encoding: JSONEncoding.default)
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

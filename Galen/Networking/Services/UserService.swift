//
//  UserService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum UserService {
    case login(email: String, password: String)
    case logout
}

extension UserService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)user")! }
    
    
    var path: String {
        switch self {
        case .login:
            return "/login"
        case .logout:
            return "/logout"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .login(email, pass):
            return .requestParameters(parameters: ["email": email, "password": pass], encoding: JSONEncoding.default)
        case .logout:
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

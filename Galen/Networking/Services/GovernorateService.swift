//
//  GovernorateService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum GovernorateService {
    case allGovs
    case viewGovs
}

extension GovernorateService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)goves")! }
    
    
    var path: String {
        switch self {
        case .allGovs:
            return "/all"
        case .viewGovs:
            return "/view"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .allGovs, .viewGovs:
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


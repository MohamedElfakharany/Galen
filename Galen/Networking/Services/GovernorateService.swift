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
}

extension GovernorateService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)goves")! }
    
    
    var path: String {
        switch self {
        case .allGovs:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        switch self {
        case .allGovs:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .allGovs:
            return .requestPlain
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


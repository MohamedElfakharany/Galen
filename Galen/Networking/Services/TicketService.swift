//
//  TicketService.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum TicketService {
    case allTickets(params: [String: Any]?)
}

extension TicketService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)tickets")! }
    
    
    var path: String {
        switch self {
        case .allTickets:
            return "/all"
        }
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .allTickets(params):
            if params == nil {
                return .requestPlain
            } else {
                return .requestParameters(parameters: params!, encoding: JSONEncoding.default)
            }
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

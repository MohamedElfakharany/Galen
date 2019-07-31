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
    case allTickets
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
        case .allTickets:
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

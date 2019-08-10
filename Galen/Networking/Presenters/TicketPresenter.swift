//
//  TicketPresenter.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya
import Moya_ModelMapper


protocol TicketDelegate: class {
    func getAllTicketsDidSuccess()
    func getAllTicketsDidFail(_ message: String)
}


class TicketPresenter {
    
    weak var delegate: TicketDelegate?
    let provider = MoyaProvider<TicketService>()
    var tickets = [Ticket]()
    
    
    init(delegate: TicketDelegate) {
        self.delegate = delegate
    }
    
    func getAllTickets(params : [String: Any]?){
        provider.request(.allTickets(params: params)) { result in
            switch result {
            case let .success(response):
                
                let statusCode = response.statusCode
                print("Status Code: ", statusCode)
                
                do {
                    let data = try response.map(to: AllTicketsResponse.self)
                    if data.done == false {
                        print("response status false")
                        self.delegate?.getAllTicketsDidFail("Request failed")
                    } else {
                        print("Response: ")
                        dump(data)
                        self.tickets = data.list ?? []
                        self.delegate?.getAllTicketsDidSuccess()
                    }
                } catch {
                    print("Error in parsing JSON")
                    self.delegate?.getAllTicketsDidFail("Error in parsing JSON")
                }
                
            case let .failure(error):
                print("Request Failed. Error: ", error.localizedDescription)
                self.delegate?.getAllTicketsDidFail(error.localizedDescription)
            }
        }
    }
    
}

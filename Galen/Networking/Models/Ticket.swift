//
//  Ticket.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class Ticket: Mappable {
    
    var id: String!
    var ticketID: Int?
    var date, code: String?
    var selectedTime: Time?
    var selectedShift: Shift?
    var selectedDoctor: Doctor?
    var selectedClinic: Clinic?
    var selectedSpecialty: Speciality?
    var selectedHospital: Hospital?
    var active: Bool?
    var status: TicketStatus?
    var addUserInfo, editUserInfo: UserInfo?
    var imageURL: String?
    var patient: Patient?
    var ticketDate: TicketDate?
    
    
    required init?(map: Map) {}
    
    
    func mapping(map: Map) {
        id <- map["_id"]
        ticketID <- map["id"]
        date <- map["date"]
        code <- map["code"]
        selectedTime <- map["selected_time"]
        selectedShift <- map["selected_shift"]
        selectedDoctor <- map["selected_doctor"]
        selectedClinic <- map["selected_clinic"]
        selectedSpecialty <- map["selected_specialty"]
        selectedHospital <- map["selected_hospital"]
        active <- map["active"]
        status <- map["status"]
        addUserInfo <- map["add_user_info"]
        editUserInfo <- map["edit_user_info"]
        imageURL <- map["image_url"]
        patient <- map["patient"]
        ticketDate <- map["ticket_date"]
    }
    
}



struct TicketDate: Mappable {
    
    var date: String!
    
    init?(map: Map) {}

    mutating func mapping(map: Map) {
        date <- map["date"]
    }
    
}


struct TicketStatus: Mappable {
    
    var id: Int!
    var code: Int?
    var name, nameEn, en, ar: String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        code <- map["code"]
        name <- map["name"]
        en <- map["en"]
        ar <- map["ar"]
        nameEn <- map["name_en"]
    }
}

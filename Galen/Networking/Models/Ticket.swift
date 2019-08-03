//
//  Ticket.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

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
    
    
    required init(map: Mapper) throws {
        try id = map.from("_id")
        ticketID = map.optionalFrom("id")
        date = map.optionalFrom("date")
        code = map.optionalFrom("code")
        selectedTime = map.optionalFrom("selected_time")
        selectedShift = map.optionalFrom("selected_shift")
        selectedDoctor = map.optionalFrom("selected_doctor")
        selectedClinic = map.optionalFrom("selected_clinic")
        selectedSpecialty = map.optionalFrom("selected_specialty")
        selectedHospital = map.optionalFrom("selected_hospital")
        active = map.optionalFrom("active")
        status = map.optionalFrom("status")
        addUserInfo = map.optionalFrom("add_user_info")
        editUserInfo = map.optionalFrom("edit_user_info")
        imageURL = map.optionalFrom("image_url")
        patient = map.optionalFrom("patient")
        ticketDate = map.optionalFrom("ticket_date")
    }
    
}



struct TicketDate: Mappable {
    
    var date: String!
    
    init(map: Mapper) throws {
        try date = map.from("date")
    }
    
}


struct TicketStatus: Mappable {
    
    var id: Int!
    var code: Int?
    var name, nameEn, en, ar: String?
    
    
    init(map: Mapper) throws {
        try id = map.from("id")
        code = map.optionalFrom("code")
        name = map.optionalFrom("name")
        en = map.optionalFrom("en")
        ar = map.optionalFrom("ar")
        nameEn = map.optionalFrom("name_en")
    }
}

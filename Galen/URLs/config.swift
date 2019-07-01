//
//  config.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct URLs {
    
    static let main = "http://intmicrotec.neat-url.com:6566/api/"
    
    static let register           = main + "register/add"
    static let login                = main + "user/login"
    static let restPassword  = main + "restPassword"
    static let editProfile       = main + "patients/update"
    static let allSpeciality    = main + "medical_specialties/all"
    static let allGovs            = main + "goves/all"
    static let allCities           = main + "cities/all"
    static let ticketUpdate = main + "tickets/update"
    static let logOut            = main + "user/logout"
    static let allInsuranceCompanies = main + "medical_insurance_companies/all"
    static let viewCities = main + "cities/view"
    static let viewGovs = main + "goves/view"
    static let deletePatient = main + "patients/delete"
    static let allTickets                   = main + "tickets/all"
    static let hospitalUpdate         = main + "hospitals/update"
    static let allHospital                 = main + "hospitals/all"
    static let addDoctor = main + "doctors/add"
    static let viewDoctor = main + "doctors/view"
    static let updateDoctors = main + "doctors/update"
    
    
}

//
//  config.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

struct URLsPatient {
    
    static let main = "http://microtec1.egytag.com:30001/api/"
    
    static let register           = main + "register/add"
    static let login                = main + "user/login"
    static let restPassword  = main + "restPassword"
    static let EditProfile       = main + "patients/update"
    
}

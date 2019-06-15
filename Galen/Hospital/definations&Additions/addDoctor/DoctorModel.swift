//
//  DoctorModel.swift
//  Galen
//
//  Created by Amr Ali on 4/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

struct SDoctor : Codable {
  let name : String
  let nathional_id : String
  let active : String
    let speciality : Speciality
    let gov : City
    let city : Area
  let address : String
  let phone : String
  let mobile : String
  let whatsapp : String
  let email : String
  let notes : String
  let img : Data
  let username : String
  let discount : String
  let code : Int
  let fees : String
  let status : String
    
    init(_name : String, _nathional_id : String, _active : String ,  _specialty : Speciality , _gov : City , _city : Area , _address : String , _phone : String , _mobile : String , _whatsapp : String , _email : String , _notes : String ,  _img : Data , _username : String , _password : String , _discount : String , _code : Int , _fees : String , _status : String) {
        
        name = _name
        nathional_id = _nathional_id
        active = _active
        speciality = _specialty
        gov = _gov
        city = _city
        address = _address
        phone = _phone
        mobile = _mobile
        whatsapp = _whatsapp
        email = _email
        notes = _notes
        img = _img
        username = _username
        discount = _discount
        code = _code
        fees = _fees
        status = _status
    }
}

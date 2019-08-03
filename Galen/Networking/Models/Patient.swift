//
//  Patient.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper

class Patient: Mappable {
    
    var id, name, mobile, username: String!
    var email: String?
    var password: String?
    var imageURL: String?
    var role: String?
    var type: String?
    var roles: [Role]?
    var profile: Profile?
    var permissions: [String]?
    var userInfo, addedUserInfo, addUserInfo, editUserInfo: UserInfo?
    var patientName, patientMobile, patientUserName, patientPassword: String?
    var birthDateDay: String?
    var gender: Gender?
    var insuranceCompany, gov, city, country: City?
    var code: String?
    var active: Bool!
    var listID: Int!
    var favouriteList: [Doctor]?
    var phone, patientPasswordReturn: String?
    

    required init(map: Mapper) throws {
        try id = map.from("_id")
        try name =  map.from("name")
        try mobile =  map.from("mobile")
        try username =  map.from("username")
        email =  map.optionalFrom("email")
        password =  map.optionalFrom("password")
        imageURL =  map.optionalFrom("image_url")
        role =  map.optionalFrom("role")
        type =  map.optionalFrom("type")
        roles =  map.optionalFrom("roles")
        profile =  map.optionalFrom("profile")
        permissions =  map.optionalFrom("permissions")
        addedUserInfo =  map.optionalFrom("added_user_info")
        userInfo =  map.optionalFrom("user_info")
        patientName =  map.optionalFrom("patient_name")
        patientMobile =  map.optionalFrom("patient_mobile")
        patientUserName =  map.optionalFrom("patient_user_name")
        patientPassword =  map.optionalFrom("patient_password")
        birthDateDay =  map.optionalFrom("birth_date_day")
        gender =  map.optionalFrom("gender")
        insuranceCompany =  map.optionalFrom("insurance_company")
        gov =  map.optionalFrom("gov")
        city =  map.optionalFrom("city")
        country =  map.optionalFrom("country")
        code =  map.optionalFrom("code")
        addUserInfo =  map.optionalFrom("add_user_info")
        try active =  map.from("active")
        try listID =  map.from("id")
        editUserInfo =  map.optionalFrom("edit_user_info")
        favouriteList =  map.optionalFrom("favourite_list")
        phone =  map.optionalFrom("phone")
        patientPasswordReturn =  map.optionalFrom("patient_password_return")
    }

}

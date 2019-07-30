//
//  Patient.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

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
    
    
    required init?(map: Map) {}


    func mapping(map: Map) {
        id <- map["_id"]
        name <- map["name"]
        mobile <- map["mobile"]
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        imageURL <- map["image_url"]
        role <- map["role"]
        type <- map["type"]
        roles <- map["roles"]
        profile <- map["profile"]
        permissions <- map["permissions"]
        addedUserInfo <- map["added_user_info"]
        userInfo <- map["user_info"]
        patientName <- map["patient_name"]
        patientMobile <- map["patient_mobile"]
        patientUserName <- map["patient_user_name"]
        patientPassword <- map["patient_password"]
        birthDateDay <- map["birth_date_day"]
        gender <- map["gender"]
        insuranceCompany <- map["insurance_company"]
        gov <- map["gov"]
        city <- map["city"]
        country <- map["country"]
        code <- map["code"]
        addUserInfo <- map["add_user_info"]
        active <- map["active"]
        listID <- map["id"]
        editUserInfo <- map["edit_user_info"]
        favouriteList <- map["favourite_list"]
        phone <- map["phone"]
        patientPasswordReturn <- map["patient_password_return"]
    }

}

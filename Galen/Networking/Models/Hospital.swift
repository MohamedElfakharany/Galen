//
//  Hospital.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import ObjectMapper

class Hospital: Mappable {
   
    var id: String?
    var hospitalID: Int?
    var name, mobile, username, email: String?
    var password, imageURL, role, type: String?
    var roles: [Role]?
    var profile: Profile?
    var permissions: [String]?
    var userInfo, addedUserInfo, addUserInfo, editUserInfo: UserInfo?
    var hospitalName, hospitalMobile, hospitalUserName, hospitalPassword: String?
    var doctorList: [Doctor]?
    var insuranceCompanyList: [InsuranceCompany]?
    var nurseList : [String]?   /////// revise this later
    var active: Bool?
    var latitude, longitude: String?
    var gov, city: City?
    var hospitalLatitude, hospitalLongitude, address, website: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        id <- map["_id"]
        hospitalID <- map["id"]
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
        userInfo <- map["user_info"]
        addedUserInfo <- map["added_user_info"]
        addUserInfo <- map["add_user_info"]
        editUserInfo <- map["edit_user_info"]
        hospitalName <- map["hospital_name"]
        hospitalMobile <- map["hospital_mobile"]
        hospitalUserName <- map["hospital_user_name"]
        hospitalPassword <- map["hospital_password"]
        gov <- map["gov"]
        city <- map["city"]
        active <- map["active"]
        doctorList <- map["doctor_list"]
        nurseList <- map["nurse_list"]
        insuranceCompanyList <- map["insurance_company_list"]
        latitude <- map["Latitude"]
        longitude <- map["Longitude"]
        hospitalLatitude <- map["latitude"]
        hospitalLongitude <- map["longitude"]
        address <- map["address"]
        website <- map["website"]
    }
    
}


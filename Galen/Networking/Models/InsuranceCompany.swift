//
//  InsuranceCompany.swift
//  Galen
//
//  Created by Eslam Shaker  on 7/30/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Mapper


class InsuranceCompany: Mappable {
    
    let id: String!
    let companyID: Int?
    let name: String!
    let mobile, username, email, password: String?
    let imageURL: String?
    let role, type: String?
    let roles: [Role]?
    let profile: Profile?
    let permissions: [String]?
    let userInfo, addedUserInfo, addUserInfo: UserInfo?
    let insuranceCompanyName, insuranceCompanyMobile, insuranceCompanyUserName, insuranceCompanyPassword: String?
    let active: Bool?
    let insuranceSlidesList, blackAnalyseList, blackScanList, blackDrugList: [String]?
    let blackOperationList, approveAnalyseList, approveScanList, approveDrugList: [String]?
    let approveOperationList: [String]?
    let perYear, needApprove: Bool?
    let phone: String?
    
    
    required init(map: Mapper) throws {
        try name = map.from("name")
        try id = map.from("_id")
        companyID = map.optionalFrom("id")
        mobile = map.optionalFrom("mobile")
        username = map.optionalFrom("username")
        email = map.optionalFrom("email")
        password = map.optionalFrom("password")
        imageURL = map.optionalFrom("image_url")
        role = map.optionalFrom("role")
        type = map.optionalFrom("type")
        roles = map.optionalFrom("roles")
        profile = map.optionalFrom("profile")
        permissions = map.optionalFrom("permissions")
        addedUserInfo = map.optionalFrom("added_user_info")
        userInfo = map.optionalFrom("user_info")
        insuranceCompanyName = map.optionalFrom("insurance_company_name")
        insuranceCompanyMobile = map.optionalFrom("insurance_company_mobile")
        insuranceCompanyUserName = map.optionalFrom("insurance_company_user_name")
        insuranceCompanyPassword = map.optionalFrom("insurance_company_password")
        addUserInfo = map.optionalFrom("add_user_info")
        active = map.optionalFrom("active")
        insuranceSlidesList = map.optionalFrom("insurance_slides_list")
        blackAnalyseList = map.optionalFrom("black_analyse_list")
        blackScanList = map.optionalFrom("black_scan_list")
        blackDrugList = map.optionalFrom("black_drug_list")
        blackOperationList = map.optionalFrom("black_operation_list")
        approveAnalyseList = map.optionalFrom("approve_analyse_list")
        approveScanList = map.optionalFrom("approve_scan_list")
        approveDrugList = map.optionalFrom("approve_drug_list")
        approveOperationList = map.optionalFrom("approve_operation_list")
        perYear = map.optionalFrom("per_year")
        needApprove = map.optionalFrom("need_approve")
        phone = map.optionalFrom("phone")
    }

}

//
//  InsurnaceCompnies.swift
//  Galen
//
//  Created by Amr Ali on 02/07/2019.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let insurnaceCompanies = try? newJSONDecoder().decode(InsurnaceCompanies.self, from: jsonData)

import Foundation

// MARK: - InsurnaceCompanies
struct InsurnaceCompanies: Codable {
    let id: String?
    let insurnaceCompaniesID: Int?
    let imageURL: String?
    let active, perYear, needApprove: Bool?
    let insuranceSlidesList, blackAnalyseList, blackScanList, blackDrugList: [List]?
    let blackOperationList, approveAnalyseList, approveScanList, approveDrugList: [List]?
    let approveOperationList: [List]?
    let name, phone, mobile: String?
    let addUserInfo: AddUserInfo?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case insurnaceCompaniesID = "id"
        case imageURL = "image_url"
        case active
        case perYear = "per_year"
        case needApprove = "need_approve"
        case insuranceSlidesList = "insurance_slides_list"
        case blackAnalyseList = "black_analyse_list"
        case blackScanList = "black_scan_list"
        case blackDrugList = "black_drug_list"
        case blackOperationList = "black_operation_list"
        case approveAnalyseList = "approve_analyse_list"
        case approveScanList = "approve_scan_list"
        case approveDrugList = "approve_drug_list"
        case approveOperationList = "approve_operation_list"
        case name, phone, mobile
        case addUserInfo = "add_user_info"
    }
}

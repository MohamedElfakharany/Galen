//
//  RegisterService.swift
//  Galen
//
//  Created by Eslam Shaker  on 8/4/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation
import Moya

enum RegisterService {
    case newPatient(name: String, mobile: String, username: String, password: String)
    case newDoctor(name: String, mobile: String, username: String, password: String)
    case newHospital(name: String, mobile: String, username: String, password: String)
    case newPharmacy(name: String, mobile: String, username: String, password: String)
    case newClinic(name: String, mobile: String, username: String, password: String)
    case newScanCenter(name: String, mobile: String, username: String, password: String)
    case newAnalyzeCenter(name: String, mobile: String, username: String, password: String)
    case newInsuranceCompany(name: String, mobile: String, username: String, password: String)
    case newNurse(name: String, mobile: String, username: String, password: String)
}

extension RegisterService: TargetType {
    
    
    var baseURL: URL { return URL(string: "\(URLs.main)register/add")! }
    
    
    var path: String {
        return ""
    }
    
    
    var method: Moya.Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case let .newPatient(name, mobile, username, password):
            return .requestParameters(parameters: ["patient_name": name, "patient_mobile": mobile, "patient_user_name": username, "patient_password": password], encoding: JSONEncoding.default)
        case let .newDoctor(name, mobile, username, password):
            return .requestParameters(parameters: ["doctor_name": name, "doctor_mobile": mobile, "doctor_user_name": username, "doctor_password": password], encoding: JSONEncoding.default)
        case let .newHospital(name, mobile, username, password):
            return .requestParameters(parameters: ["hospital_name": name, "hospital_mobile": mobile, "hospital_user_name": username, "hospital_password": password], encoding: JSONEncoding.default)
        case let .newPharmacy(name, mobile, username, password):
            return .requestParameters(parameters: ["pharmacy_name": name, "pharmacy_mobile": mobile, "pharmacy_user_name": username, "pharmacy_password": password], encoding: JSONEncoding.default)
        case let .newClinic(name, mobile, username, password):
            return .requestParameters(parameters: ["clinic_name": name, "clinic_mobile": mobile, "clinic_user_name": username, "clinic_password": password], encoding: JSONEncoding.default)
        case let .newScanCenter(name, mobile, username, password):
            return .requestParameters(parameters: ["scan_center_name": name, "scan_center_mobile": mobile, "scan_center_user_name": username, "scan_center_password": password], encoding: JSONEncoding.default)
        case let .newAnalyzeCenter(name, mobile, username, password):
            return .requestParameters(parameters: ["analyses_center_name": name, "analyses_center_mobile": mobile, "analyses_center_user_name": username, "analyses_center_password": password], encoding: JSONEncoding.default)
        case let .newInsuranceCompany(name, mobile, username, password):
            return .requestParameters(parameters: ["insurance_company_name": name, "insurance_company_mobile": mobile, "insurance_company_user_name": username, "insurance_company_password": password], encoding: JSONEncoding.default)
        case let .newNurse(name, mobile, username, password):
            return .requestParameters(parameters: ["nurse_name": name, "nurse_mobile": mobile, "nurse_user_name": username, "nurse_password": password], encoding: JSONEncoding.default)
        
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String: String]? {
        return ["Content-type": "application/json",
                "Authorization" : UserDefaults.standard.string(forKey: "accessToken") ?? ""]
    }
}

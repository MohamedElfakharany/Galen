//
//  File.swift
//  Galen
//
//  Created by elfakharany on 5/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//


// To parse the JSON, add this file to your project and do:
//
//   let patientLogin = try? newJSONDecoder().decode(PatientLogin.self, from: jsonData)
//
// To read values from URLs:
//
//   let task = URLSession.shared.patientLoginTask(with: url) { patientLogin, response, error in
//     if let patientLogin = patientLogin {
//       ...
//     }
//   }
//   task.resume()

import Foundation

struct Client: Codable {
    let accessToken: String?
    let user: User?
    let done: Bool?
}

struct User: Codable {
    let name, mobile, username, email: String?
    let password: String?
    let imageURL: String?
    let role, type: String?
    let roles: [Role]?
    let profile: Profile?
    let userPermissions: [String]?
    let addedUserInfo: AddedUserInfo?
    let userID: Int?
    let refInfo: RefInfo?
    let id: String?
    let permissions: [String]?
    let permissionsInfo: [PermissionsInfo]?
    let memory: Bool?
    
    enum CodingKeys: String, CodingKey {
        case name, mobile, username, email, password
        case imageURL = "image_url"
        case role, type, roles, profile
        case userPermissions = "permissions"
        case addedUserInfo = "added_user_info"
        case userID = "id"
        case refInfo = "ref_info"
        case id = "_id"
        case permissions = "$permissions"
        case permissionsInfo = "$permissions_info"
        case memory = "$memory"
    }
}

struct AddedUserInfo: Codable {
    let id, email: String?
    let date: String?
    let ip: String?
}

struct PermissionsInfo: Codable {
    let moduleName, screenName, name, en: String?
    let ar: String?
    
    enum CodingKeys: String, CodingKey {
        case moduleName = "module_name"
        case screenName = "screen_name"
        case name, en, ar
    }
}

struct Profile: Codable {
    let name, mobile: String?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name, mobile
        case imageURL = "image_url"
    }
}

struct RefInfo: Codable {
    let id: Int?
}

struct Role: Codable {
    let name: String?
}

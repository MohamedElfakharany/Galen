
// To parse the JSON, add this file to your project and do:
//
//   let city = try? newJSONDecoder().decode(City.self, from: jsonData)

import Foundation

// MARK: - City
struct City: Codable {
    let id: String?
    let cityID: Int?
    let imageURL: String?
    let active: Bool?
    let name: String?
    let gov: Governate?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case cityID = "id"
        case imageURL = "image_url"
        case active, name, gov
    }
    
}

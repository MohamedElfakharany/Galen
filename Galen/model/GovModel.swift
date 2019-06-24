// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let governate = try? newJSONDecoder().decode(Governate.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseGovernate { response in
//     if let governate = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Governate
struct Governate: Codable {
    let id, imageURL: String?
    let active: Bool?
    let name: String?
    let addUserInfo: AddUserInfo?
    let governateID: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case imageURL = "image_url"
        case active, name
        case addUserInfo = "add_user_info"
        case governateID = "id"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseAddUserInfo { response in
//     if let addUserInfo = response.result.value {
//       ...
//     }
//   }

// MARK: - AddUserInfo
struct AddUserInfo: Codable {
    let id: Int?
    let email, date, ip, name: String?
}

// MARK: - Helper functions for creating encoders and decoders


// MARK: - Alamofire response handlers

extension DataRequest {
    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            
            return Result { try newJSONDecoder().decode(T.self, from: data) }
        }
    }
    
    @discardableResult
    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseGovernate(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Governate>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

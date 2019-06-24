// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let speciality = try Speciality(json)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSpeciality { response in
//     if let speciality = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Speciality
struct Speciality: Codable {
    let id: String?
    let specialityID: Int?
    let imageURL: String?
    let active: Bool?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case specialityID = "id"
        case imageURL = "image_url"
        case active, name
    }
}

// MARK: Speciality convenience initializers and mutators

extension Speciality {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Speciality.self, from: data)
    }
    
    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }
    
    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }
    
    func with(
        id: String?? = nil,
        specialityID: Int?? = nil,
        imageURL: String?? = nil,
        active: Bool?? = nil,
        name: String?? = nil
        ) -> Speciality {
        return Speciality(
            id: id ?? self.id,
            specialityID: specialityID ?? self.specialityID,
            imageURL: imageURL ?? self.imageURL,
            active: active ?? self.active,
            name: name ?? self.name
        )
    }
    
    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
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
    func responseSpeciality(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Speciality>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

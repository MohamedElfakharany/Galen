// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let hospital = try? newJSONDecoder().decode(Hospital.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseHospital { response in
//     if let hospital = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Hospital
struct Hospital: Codable {
    let id: String?
    let hospitalID: Int?
    let name, mobile, username, email: String?
    let password, imageURL, role, type: String?
    let roles: [Role]?
    let profile: Profile?
    let permissions: [JSONAny]?
    let addedUserInfo: UserInfo?
    let userInfo: UserInfoClass?
    let hospitalName, hospitalMobile, hospitalUserName, hospitalPassword: String?
    let addUserInfo: UserInfo?
    let doctorList: [Doctor]?
    let nurseList, insuranceCompanyList: [List]?
    let active: Bool?
    let latitude, longitude: String?
    let city: CityElement?
    let editUserInfo: UserInfo?
    let gov: CityElement?
    let hospitalLatitude, hospitalLongitude, address, website: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case hospitalID = "id"
        case name, mobile, username, email, password
        case imageURL = "image_url"
        case role, type, roles, profile, permissions
        case addedUserInfo = "added_user_info"
        case userInfo = "user_info"
        case hospitalName = "hospital_name"
        case hospitalMobile = "hospital_mobile"
        case hospitalUserName = "hospital_user_name"
        case hospitalPassword = "hospital_password"
        case addUserInfo = "add_user_info"
        case doctorList = "doctor_list"
        case nurseList = "nurse_list"
        case insuranceCompanyList = "insurance_company_list"
        case active
        case latitude = "Latitude"
        case longitude = "Longitude"
        case city
        case editUserInfo = "edit_user_info"
        case gov
        case hospitalLatitude = "latitude"
        case hospitalLongitude = "longitude"
        case address, website
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUserInfo { response in
//     if let userInfo = response.result.value {
//       ...
//     }
//   }

// MARK: - UserInfo
struct UserInfo: Codable {
    let id: Int?
    let email: String?
    let date: String?
    let ip: String?
    let name: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseCityElement { response in
//     if let cityElement = response.result.value {
//       ...
//     }
//   }

// MARK: - CityElement
struct CityElement: Codable {
    let id: String?
    let cityID: Int?
    let name: String?
    let imageURL: ImageURL?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case cityID = "id"
        case name
        case imageURL = "image_url"
    }
}

enum ImageURL: String, Codable {
    case empty = ""
    case imagesMedicalSpecialtyPNG = "/images/medical_specialty.png"
    case ss = "ss"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseHospitalDoctorList { response in
//     if let hospitalDoctorList = response.result.value {
//       ...
//     }
//   }

// MARK: - HospitalDoctorList
struct HospitalDoctorList: Codable {
    let doctor: PurpleDoctor?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleDoctor { response in
//     if let purpleDoctor = response.result.value {
//       ...
//     }
//   }

// MARK: - PurpleDoctor
struct PurpleDoctor: Codable {
    let id: String?
    let doctorID: Int?
    let name: String?
    let active: Bool?
    let hospital: HospitalClass?
    let phone, mobile, email, imageURL: String?
    let acceptCode: Bool?
    let ratingList: [JSONAny]?
    let reviewList: [ReviewList]?
    let fee: Int?
    let info, code: String?
    let specialty: CityElement?
    let gender: String?
    let clinic: PurpleClinic?
    let addUserInfo, editUserInfo: UserInfo?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case doctorID = "id"
        case name, active, hospital, phone, mobile, email
        case imageURL = "image_url"
        case acceptCode = "accept_code"
        case ratingList = "rating_list"
        case reviewList = "review_list"
        case fee, info, code, specialty, gender, clinic
        case addUserInfo = "add_user_info"
        case editUserInfo = "edit_user_info"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleClinic { response in
//     if let purpleClinic = response.result.value {
//       ...
//     }
//   }

// MARK: - PurpleClinic
struct PurpleClinic: Codable {
    let name: String?
    let id: Int?
    let active: Bool?
    let latitude, longitude: Double?
    let address: String?
    let city, gov: PurpleCity?
    let imageURL, email: String?
    let insuranceCompanyList: [CityElement]?
    let nurseList: [JSONAny]?
    let website, phone: String?
    let doctorList: [PurpleDoctorList]?
    let hospital: PurpleCity?
    
    enum CodingKeys: String, CodingKey {
        case name, id, active, latitude, longitude, address, city, gov
        case imageURL = "image_url"
        case email
        case insuranceCompanyList = "insurance_company_list"
        case nurseList = "nurse_list"
        case website, phone
        case doctorList = "doctor_list"
        case hospital
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleCity { response in
//     if let purpleCity = response.result.value {
//       ...
//     }
//   }

// MARK: - PurpleCity
struct PurpleCity: Codable {
    let id: Int?
    let name: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responsePurpleDoctorList { response in
//     if let purpleDoctorList = response.result.value {
//       ...
//     }
//   }

// MARK: - PurpleDoctorList
struct PurpleDoctorList: Codable {
    let doctor: DoctorElement?
    let name: String?
    let active: Bool?
    let hospital: HospitalClass?
    let phone, email, imageURL: String?
    let acceptCode: Bool?
    let ratingList, reviewList: [JSONAny]?
    let fee: Int?
    let info, code: String?
    let doctorListID: Int?
    let id: String?
    let specialty: CityElement?
    let gender: String?
    let clinic: FluffyClinic?
    
    enum CodingKeys: String, CodingKey {
        case doctor, name, active, hospital, phone, email
        case imageURL = "image_url"
        case acceptCode = "accept_code"
        case ratingList = "rating_list"
        case reviewList = "review_list"
        case fee, info, code
        case doctorListID = "id"
        case id = "_id"
        case specialty, gender, clinic
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFluffyClinic { response in
//     if let fluffyClinic = response.result.value {
//       ...
//     }
//   }

// MARK: - FluffyClinic
struct FluffyClinic: Codable {
    let name: String?
    let id: Int?
    let active: Bool?
    let latitude, longitude: Double?
    let address: String?
    let city, gov, hospital: PurpleCity?
    let doctorList: [DoctorElement]?
    let imageURL, email: String?
    let insuranceCompanyList: [CityElement]?
    let nurseList: [JSONAny]?
    let website, phone: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, active, latitude, longitude, address, city, gov, hospital
        case doctorList = "doctor_list"
        case imageURL = "image_url"
        case email
        case insuranceCompanyList = "insurance_company_list"
        case nurseList = "nurse_list"
        case website, phone
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFluffyDoctorList { response in
//     if let fluffyDoctorList = response.result.value {
//       ...
//     }
//   }

// MARK: - FluffyDoctorList
struct FluffyDoctorList: Codable {
    let doctor: DoctorElement?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTentacledClinic { response in
//     if let tentacledClinic = response.result.value {
//       ...
//     }
//   }

// MARK: - TentacledClinic
struct TentacledClinic: Codable {
    let name: String?
    let id: Int?
    let active: Bool?
    let latitude, longitude: Double?
    let address: String?
    let city, gov: PurpleCity?
    let imageURL, email: String?
    let insuranceCompanyList: [CityElement]?
    let nurseList: [JSONAny]?
    let website, phone: String?
    let doctorList: [FluffyDoctorList]?
    let hospital: PurpleCity?
    
    enum CodingKeys: String, CodingKey {
        case name, id, active, latitude, longitude, address, city, gov
        case imageURL = "image_url"
        case email
        case insuranceCompanyList = "insurance_company_list"
        case nurseList = "nurse_list"
        case website, phone
        case doctorList = "doctor_list"
        case hospital
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDoctorElement { response in
//     if let doctorElement = response.result.value {
//       ...
//     }
//   }

// MARK: - DoctorElement
struct DoctorElement: Codable {
    let name: String?
    let active: Bool?
    let hospital: PurpleCity?
    let phone, email, imageURL: String?
    let acceptCode: Bool?
    let ratingList, reviewList: [JSONAny]?
    let fee: Int?
    let info, code: String?
    let doctorID: Int?
    let id: String?
    let specialty: CityElement?
    let gender: String?
    let clinic: TentacledClinic?
    
    enum CodingKeys: String, CodingKey {
        case name, active, hospital, phone, email
        case imageURL = "image_url"
        case acceptCode = "accept_code"
        case ratingList = "rating_list"
        case reviewList = "review_list"
        case fee, info, code
        case doctorID = "id"
        case id = "_id"
        case specialty, gender, clinic
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseHospitalClass { response in
//     if let hospitalClass = response.result.value {
//       ...
//     }
//   }

// MARK: - HospitalClass
struct HospitalClass: Codable {
    let id: Int?
    let name: String?
    let doctorList: [List]?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case doctorList = "doctor_list"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseList { response in
//     if let list = response.result.value {
//       ...
//     }
//   }

// MARK: - List
struct List: Codable {
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseReviewList { response in
//     if let reviewList = response.result.value {
//       ...
//     }
//   }

// MARK: - ReviewList
struct ReviewList: Codable {
    let comment: String?
    let rate: Int?
    let date, patientName, patientImageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case comment, rate, date
        case patientName = "patient_name"
        case patientImageURL = "patient_image_url"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseProfile { response in
//     if let profile = response.result.value {
//       ...
//     }
//   }

// MARK: - Profile
struct HProfile: Codable {
    let name, mobile: String?
    let imageURL: JSONNull?
    
    enum CodingKeys: String, CodingKey {
        case name, mobile
        case imageURL = "image_url"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseRole { response in
//     if let role = response.result.value {
//       ...
//     }
//   }

// MARK: - Role
struct HRole: Codable {
    let name: String?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseUserInfoClass { response in
//     if let userInfoClass = response.result.value {
//       ...
//     }
//   }

// MARK: - UserInfoClass
struct UserInfoClass: Codable {
    let id: Int?
}

// MARK: - Helper functions for creating encoders and decoders

//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}

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
    func responseHospital(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Hospital>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String
    
    required init?(intValue: Int) {
        return nil
    }
    
    required init?(stringValue: String) {
        key = stringValue
    }
    
    var intValue: Int? {
        return nil
    }
    
    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {
    
    let value: Any
    
    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }
    
    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }
    
    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }
    
    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }
    
    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }
    
    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }
    
    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }
    
    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

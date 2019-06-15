


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let ticket = try? newJSONDecoder().decode(Ticket.self, from: jsonData)

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseTicket { response in
//     if let ticket = response.result.value {
//       ...
//     }
//   }

import Foundation
import Alamofire

// MARK: - Ticket
struct Ticket: Codable {
    let date: String?
    let analysesList: [List]?
    let selectedTime: SelectedTime?
    let active: Bool?
    let id: String?
    let selectedSpecialty: SelectedDoctor?
    let ticketID: Int?
    let imageURL: String?
    let doctorTicket: Doctor?
    let periodTicket: Int?
    let status: Status?
    let selectedTimeSlot: SelectedTime?
    let scansList, drugsList: [List]?
    let code: String?
    let operationList: [List]?
    let selectedShift: SelectedShift?
    let selectedHospital: SelectedDoctor?
    let addUserInfo: AddUserInfo?
    let selectedClinic: SelectedClinic?
    let selectedDoctor: SelectedDoctor?
    let clinicTicket: ClinicTicket?
    
    enum CodingKeys: String, CodingKey {
        case date
        case analysesList = "analyses_list"
        case selectedTime = "selected_time"
        case active
        case id = "_id"
        case selectedSpecialty = "selected_specialty"
        case ticketID = "id"
        case imageURL = "image_url"
        case doctorTicket = "doctor_ticket"
        case periodTicket = "period_ticket"
        case status
        case selectedTimeSlot = "selected_time_slot"
        case scansList = "scans_list"
        case drugsList = "drugs_list"
        case code
        case operationList = "operation_list"
        case selectedShift = "selected_shift"
        case selectedHospital = "selected_hospital"
        case addUserInfo = "add_user_info"
        case selectedClinic = "selected_clinic"
        case selectedDoctor = "selected_doctor"
        case clinicTicket = "clinic_ticket"
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
    let name, email: String?
    let ip, date: String?
    let id: Int?
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
    let active: Bool?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseClinicTicket { response in
//     if let clinicTicket = response.result.value {
//       ...
//     }
//   }

// MARK: - ClinicTicket
struct ClinicTicket: Codable {
    let nurseList: [NurseList]?
    let addUserInfo: AddUserInfo?
    let shiftList: [SelectedShift]?
    
    enum CodingKeys: String, CodingKey {
        case nurseList = "nurse_list"
        case addUserInfo = "add_user_info"
        case shiftList = "shift_list"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseNurseList { response in
//     if let nurseList = response.result.value {
//       ...
//     }
//   }

// MARK: - NurseList
struct NurseList: Codable {
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSelectedShift { response in
//     if let selectedShift = response.result.value {
//       ...
//     }
//   }

// MARK: - SelectedShift
struct SelectedShift: Codable {
    let name: String?
    let timesList: [SelectedTime]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case timesList = "times_list"
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSelectedTime { response in
//     if let selectedTime = response.result.value {
//       ...
//     }
//   }

// MARK: - SelectedTime
struct SelectedTime: Codable {
    let to: From?
    let day: Day?
    let from: From?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDay { response in
//     if let day = response.result.value {
//       ...
//     }
//   }

// MARK: - Day
struct Day: Codable {
    let code: Int?
    let en, name, ar: String?
    let id: Int?
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseFrom { response in
//     if let from = response.result.value {
//       ...
//     }
//   }

// MARK: - From
struct From: Codable {
    let hour, minute: Int?
    let date: DateEnum?
}

enum DateEnum: String, Codable {
    case the18991230T231451000Z = "1899-12-30T23:14:51.000Z"
    case the18991231T002451000Z = "1899-12-31T00:24:51.000Z"
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseDoctor { response in
//     if let doctor = response.result.value {
//       ...
//     }
//   }

// MARK: - Doctor
struct Doctor: Codable {
    let detectionDuration: Int?
    let doctor: SelectedDoctor?
    let shift: SelectedShift?
    
    enum CodingKeys: String, CodingKey {
        case detectionDuration = "detection_Duration"
        case doctor, shift
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSelectedDoctor { response in
//     if let selectedDoctor = response.result.value {
//       ...
//     }
//   }

// MARK: - SelectedDoctor
class SelectedDoctor: Codable {
    let name: String?
    let specialty: SelectedDoctor?
    let selectedDoctorID: Int?
    let id, imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name, specialty
        case selectedDoctorID = "id"
        case id = "_id"
        case imageURL = "image_url"
    }
    
    init(name: String?, specialty: SelectedDoctor?, selectedDoctorID: Int?, id: String?, imageURL: String?) {
        self.name = name
        self.specialty = specialty
        self.selectedDoctorID = selectedDoctorID
        self.id = id
        self.imageURL = imageURL
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseSelectedClinic { response in
//     if let selectedClinic = response.result.value {
//       ...
//     }
//   }

// MARK: - SelectedClinic
struct SelectedClinic: Codable {
    let nurseList: [NurseList]?
    let addUserInfo: AddUserInfo?
    let shiftList: [SelectedShift]?
    let specialty: SelectedDoctor?
    let doctorList: [Doctor]?
    let id: String?
    let hospital: SelectedDoctor?
    let name, imageURL: String?
    let selectedClinicID: Int?
    let active: Bool?
    
    enum CodingKeys: String, CodingKey {
        case nurseList = "nurse_list"
        case addUserInfo = "add_user_info"
        case shiftList = "shift_list"
        case specialty
        case doctorList = "doctor_list"
        case id = "_id"
        case hospital, name
        case imageURL = "image_url"
        case selectedClinicID = "id"
        case active
    }
}

//
// To parse values from Alamofire responses:
//
//   Alamofire.request(url).responseStatus { response in
//     if let status = response.result.value {
//       ...
//     }
//   }

// MARK: - Status
struct Status: Codable {
    let name, nameEn, ar: String?
    let id: Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case nameEn = "name_en"
        case ar, id
    }
}

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}

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
    func responseTicket(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Ticket>) -> Void) -> Self {
        return responseDecodable(queue: queue, completionHandler: completionHandler)
    }
}




//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let ticket = try? newJSONDecoder().decode(Ticket.self, from: jsonData)
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseTicket { response in
////     if let ticket = response.result.value {
////       ...
////     }
////   }
//
//import Foundation
//import Alamofire
//
//// MARK: - Ticket
//struct Ticket: Codable {
//    let id: String?
//    let selectedDoctor: SelectedDoctor?
//    let selectedTime: SelectedTime?
//    let selectedSpecialty, selectedHospital: Selected?
//    let drugsList, operationList, scansList, analysesList: [JSONAny]?
//    let selectedShift: SelectedShift?
//    let status: Status?
//    let imageURL: ImageURL?
//    let date: String?
//    let selectedClinic: Selected?
//    let ticketDate: TicketDate?
//    let addUserInfo: UserInfo?
//    let active: Bool?
//    let code: String?
//    let ticketID: Int?
//    let editUserInfo: UserInfo?
//
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case selectedDoctor = "selected_doctor"
//        case selectedTime = "selected_time"
//        case selectedSpecialty = "selected_specialty"
//        case selectedHospital = "selected_hospital"
//        case drugsList = "drugs_list"
//        case operationList = "operation_list"
//        case scansList = "scans_list"
//        case analysesList = "analyses_list"
//        case selectedShift = "selected_shift"
//        case status
//        case imageURL = "image_url"
//        case date
//        case selectedClinic = "selected_clinic"
//        case ticketDate = "ticket_date"
//        case addUserInfo = "add_user_info"
//        case active, code
//        case ticketID = "id"
//        case editUserInfo = "edit_user_info"
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseUserInfo { response in
////     if let userInfo = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - UserInfo
//struct UserInfo: Codable {
//    let id: Int?
//    let email, date, ip, name: String?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseImageURL { response in
////     if let imageURL = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - ImageURL
//struct ImageURL: Codable {
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSelected { response in
////     if let selected = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Selected
//struct Selected: Codable {
//    let id: Int?
//    let name: String?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSelectedDoctor { response in
////     if let selectedDoctor = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - SelectedDoctor
//struct SelectedDoctor: Codable {
//    let id: Int?
//    let name, image: String?
//    let fee: Int?
//    let discountCode: Bool?
//    let gender, info: String?
//
//    enum CodingKeys: String, CodingKey {
//        case id, name, image, fee
//        case discountCode = "discount_code"
//        case gender, info
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSelectedShift { response in
////     if let selectedShift = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - SelectedShift
//struct SelectedShift: Codable {
//    let day, from, to: Day?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseDay { response in
////     if let day = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Day
//struct Day: Codable {
//    let id: Int?
//    let name, en, ar: String?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSelectedTime { response in
////     if let selectedTime = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - SelectedTime
//struct SelectedTime: Codable {
//    let time: String?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseStatus { response in
////     if let status = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Status
//struct Status: Codable {
//    let nameEn, nameAr: String?
//    let id: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case nameEn = "name_en"
//        case nameAr = "name_ar"
//        case id
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseTicketDate { response in
////     if let ticketDate = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - TicketDate
//struct TicketDate: Codable {
//    let date: String?
//}
//
//// MARK: - Helper functions for creating encoders and decoders
//
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
//
//// MARK: - Alamofire response handlers
//
//extension DataRequest {
//    fileprivate func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
//        return DataResponseSerializer { _, response, data, error in
//            guard error == nil else { return .failure(error!) }
//
//            guard let data = data else {
//                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
//            }
//
//            return Result { try newJSONDecoder().decode(T.self, from: data) }
//        }
//    }
//
//    @discardableResult
//    fileprivate func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
//        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
//    }
//
//    @discardableResult
//    func responseTicket(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Ticket>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}

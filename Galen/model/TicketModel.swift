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
    let clinicTicket: ClinicTicket?
    let selectedTime: SelectedTime?
    let code: String?
    let drugsList: [TList]?
    let active: Bool?
    let scansList: [TList]?
    let status: Status?
    let selectedTimeSlot: SelectedTime?
    let analysesList: [TList]?
    let selectedClinic: ClinicTicket?
    let doctorTicket: Doctor?
    let date: String?
    let selectedShift: SelectedShift?
    let imageURL: String?
    let selectedSpecialty: SelectedDoctor?
    let operationList: [TList]?
    let periodTicket: Int?
    let selectedHospital: SelectedDoctor?
    let id: String?
    let selectedDoctor: SelectedDoctor?
    let ticketID: Int?
    
    enum CodingKeys: String, CodingKey {
        case clinicTicket = "clinic_ticket"
        case selectedTime = "selected_time"
        case code
        case drugsList = "drugs_list"
        case active
        case scansList = "scans_list"
        case status
        case selectedTimeSlot = "selected_time_slot"
        case analysesList = "analyses_list"
        case selectedClinic = "selected_clinic"
        case doctorTicket = "doctor_ticket"
        case date
        case selectedShift = "selected_shift"
        case imageURL = "image_url"
        case selectedSpecialty = "selected_specialty"
        case operationList = "operation_list"
        case periodTicket = "period_ticket"
        case selectedHospital = "selected_hospital"
        case id = "_id"
        case selectedDoctor = "selected_doctor"
        case ticketID = "id"
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
struct TList: Codable {
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
    let id: String?
    let active: Bool?
    let doctorList: [Doctor]?
    let shiftList: [SelectedShift]?
    let clinicTicketID: Int?
    let nurseList: [NurseList]?
    let hospital: SelectedDoctor?
    let name, imageURL: String?
    let specialty: SelectedDoctor?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case active
        case doctorList = "doctor_list"
        case shiftList = "shift_list"
        case clinicTicketID = "id"
        case nurseList = "nurse_list"
        case hospital, name
        case imageURL = "image_url"
        case specialty
    }
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
    let id: String?
    let doctorID: Int?
    let name: String?
    let active: Bool?
    let hospital: Hospital?
    let phone, mobile, email, imageURL: String?
    let acceptCode: Bool?
    let ratingList: [JSONAny]?
    let reviewList: [ReviewList]?
    let fee: Int?
    let info, code: String?
    let specialty: Speciality?
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
//   Alamofire.request(url).responseSelectedDoctor { response in
//     if let selectedDoctor = response.result.value {
//       ...
//     }
//   }

// MARK: - SelectedDoctor
class SelectedDoctor: Codable {
    let name: String?
    let selectedDoctorID: Int?
    let id: String?
    let specialty: SelectedDoctor?
    let imageURL: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case selectedDoctorID = "id"
        case id = "_id"
        case specialty
        case imageURL = "image_url"
    }
    
    init(name: String?, selectedDoctorID: Int?, id: String?, specialty: SelectedDoctor?, imageURL: String?) {
        self.name = name
        self.selectedDoctorID = selectedDoctorID
        self.id = id
        self.specialty = specialty
        self.imageURL = imageURL
    }
}

enum Name: String, Codable {
    case hh1 = "hh1"
    case احمدجابرحسنياحمد = "احمد جابر حسني احمد"
    case طبالأسنان = "طب الأسنان"
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
    let day: Day?
    let to, from: From?
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
    let name: String?
    let id: Int?
    let ar: String?
    let code: Int?
    let en: String?
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
    let hour: Int?
    let date: DateEnum?
    let minute: Int?
}

enum DateEnum: String, Codable {
    case the18991230T231451000Z = "1899-12-30T23:14:51.000Z"
    case the18991231T002451000Z = "1899-12-31T00:24:51.000Z"
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
//   Alamofire.request(url).responseStatus { response in
//     if let status = response.result.value {
//       ...
//     }
//   }

// MARK: - Status
struct Status: Codable {
    let name: String?
    let id: Int?
    let ar, nameEn: String?
    
    enum CodingKeys: String, CodingKey {
        case name, id, ar
        case nameEn = "name_en"
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

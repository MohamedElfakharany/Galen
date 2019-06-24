//// This file was generated from JSON Schema using quicktype, do not modify it directly.
//// To parse the JSON, add this file to your project and do:
////
////   let doctor = try? newJSONDecoder().decode(Doctor.self, from: jsonData)
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseDoctor { response in
////     if let doctor = response.result.value {
////       ...
////     }
////   }
//
//import Foundation
//import Alamofire
//
//// MARK: - Doctor
//struct AbsDoctor: Codable {
//    let id: String?
//    let doctorID: Int?
//    let name: String?
//    let active: Bool?
//    let hospital: Hospital?
//    let phone, mobile, email, imageURL: String?
//    let acceptCode: Bool?
//    let ratingList: [JSONAny]?
//    let reviewList: [ReviewList]?
//    let fee: Int?
//    let info, code: String?
//    let specialty: Specialty?
//    let gender: String?
//    let clinic: Clinic?
//    let addUserInfo, editUserInfo: UserInfo?
//    
//    enum CodingKeys: String, CodingKey {
//        case id = "_id"
//        case doctorID = "id"
//        case name, active, hospital, phone, mobile, email
//        case imageURL = "image_url"
//        case acceptCode = "accept_code"
//        case ratingList = "rating_list"
//        case reviewList = "review_list"
//        case fee, info, code, specialty, gender, clinic
//        case addUserInfo = "add_user_info"
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
////struct UserInfo: Codable {
////    let id: Int?
////    let email, date, ip, name: String?
////}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseClinicDoctorList { response in
////     if let clinicDoctorList = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - ClinicDoctorList
//struct ClinicDoctorList: Codable {
//    let name: String?
//    let active: Bool?
//    let hospital: City?
//    let phone, email, imageURL: String?
//    let acceptCode: Bool?
//    let ratingList, reviewList: [ReviewList]?
//    let fee: Int?
//    let info, code: String?
//    let doctorListID: Int?
//    let id: String?
//    let specialty: Specialty?
//    let gender: String?
//    let clinic: Clinic?
//    
//    enum CodingKeys: String, CodingKey {
//        case name, active, hospital, phone, email
//        case imageURL = "image_url"
//        case acceptCode = "accept_code"
//        case ratingList = "rating_list"
//        case reviewList = "review_list"
//        case fee, info, code
//        case doctorListID = "id"
//        case id = "_id"
//        case specialty, gender, clinic
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseClinic { response in
////     if let clinic = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Clinic
//struct Clinic: Codable {
//    let name: String?
//    let id: Int?
//    let active: Bool?
//    let latitude, longitude: Double?
//    let address: String?
//    let city, gov, hospital: City?
//    let doctorList: [ClinicDoctorList]?
//    let imageURL, email: String?
//    let insuranceCompanyList: [Specialty]?
//   // let nurseList: [JSONAny]?
//    let website, phone: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case name, id, active, latitude, longitude, address, city, gov, hospital
//        case doctorList = "doctor_list"
//        case imageURL = "image_url"
//        case email
//        case insuranceCompanyList = "insurance_company_list"
////        case nurseList = "nurse_list"
//        case website, phone
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseCity { response in
////     if let city = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - City
//struct City: Codable {
//    let id: Int?
//    let name: String?
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseSpecialty { response in
////     if let specialty = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Specialty
//struct Specialty: Codable {
//    let specialtyID: Int?
//    let name, id, imageURL: String?
//    
//    enum CodingKeys: String, CodingKey {
//        case specialtyID = "id"
//        case name
//        case id = "_id"
//        case imageURL = "image_url"
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseHospital { response in
////     if let hospital = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - Hospital
//struct HospitalForDoctor: Codable {
//    let id: Int?
//    let name: String?
//    let doctorList: [HospitalDoctorList]?
//    
//    enum CodingKeys: String, CodingKey {
//        case id, name
//        case doctorList = "doctor_list"
//    }
//}
//
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseHospitalDoctorList { response in
////     if let hospitalDoctorList = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - HospitalDoctorList
//
////struct HospitalDoctorList: Codable {
////}
////
//// To parse values from Alamofire responses:
////
////   Alamofire.request(url).responseReviewList { response in
////     if let reviewList = response.result.value {
////       ...
////     }
////   }
//
//// MARK: - ReviewList
////struct ReviewList: Codable {
////    let comment: String?
////    let rate: Int?
////    let date, patientName, patientImageURL: String?
////
////    enum CodingKeys: String, CodingKey {
////        case comment, rate, date
////        case patientName = "patient_name"
////        case patientImageURL = "patient_image_url"
////    }
////}
//
//// MARK: - Helper functions for creating encoders and decoders
//
////func newJSONDecoder() -> JSONDecoder {
////    let decoder = JSONDecoder()
////    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
////        decoder.dateDecodingStrategy = .iso8601
////    }
////    return decoder
////}
////
////func newJSONEncoder() -> JSONEncoder {
////    let encoder = JSONEncoder()
////    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
////        encoder.dateEncodingStrategy = .iso8601
////    }
////    return encoder
////}
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
//    func responseDoctor(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<Doctor>) -> Void) -> Self {
//        return responseDecodable(queue: queue, completionHandler: completionHandler)
//    }
//}
//
//

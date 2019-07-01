//
//  searchResultsVC.swift
//  Galen
//
//  Created by elfakharany on 3/26/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class searchResultsVC: UIViewController {
    @IBOutlet weak var citySearchCriteriaLabel: UILabel!
    @IBOutlet weak var specialitySearchCriteriaLabel: UILabel!
    @IBOutlet weak var ICSearchCriteriaLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
     var ResultedDoctors = [Doctor]()
    
    var SpecialityIDToSearch = 0
    var CityIDToSearch = 0
    var AreaIDToSearch = 0
    var DocNameToSearch = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
        ////TESTFORRESULTES
        
        GetDoctors(name: DocNameToSearch , Speciality: SpecialityIDToSearch , governate: CityIDToSearch , City: AreaIDToSearch)
        
        ///
        
    }
    @IBAction func backBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    func GetDoctors(name : String , Speciality : Int , governate :  Int , City : Int){
        
        var myparameters : Parameters  = ["":""]
        
        if name != "" {
            myparameters = [
                "where" : [
                "doctor_list.doctor.name" : name
                ]
            ]
        }else {
            if governate != 0 && City != 0 {
                myparameters = [
                    "where" : [
                    "doctor_list.doctor.speciality.id" :  Speciality ,
                    "gov.id" : governate ,
                    "city.id" : City
                    ]
                ]
                
            } else if governate == 0 && City != 0 {
                 myparameters = [
                "where" : [
                "doctor_list.doctor.speciality.id" :  Speciality ,
                "city.id" : City
                    ]
                ]
                
            } else if governate != 0 && City == 0 {
                myparameters = [
                "where" : [
                "doctor_list.doctor.speciality.id" :  Speciality ,
               "gov.id" : governate
                    ]
                ]
                
            } else {
                
            }
            
        }
            
            print(myparameters)

            Alamofire.request(URLs.allHospital, method: .post, parameters: myparameters, encoding: URLEncoding.default, headers: nil) .responseData { response in
                switch response.result
                {
                case .success(let value):
                    let json = JSON(value).dictionary
                    do {
                        let datas = try json!["list"]?.rawData()
                        do {
                             let ResultedHospitals = try? newJSONDecoder().decode([Hospital].self, from: datas!)
                            for iHospital in ResultedHospitals!{
                                for doc in iHospital.doctorList! {
                                    let BEDoc = doc.doctor
            
                                    self.ResultedDoctors.append(BEDoc!)
                                }
                            }
                            for Docbxx in self.ResultedDoctors {
                            print(Docbxx.name)
                        }
                        }
                    } catch  {
                    }


                case .failure(_):
                    print("Failure")
                }
            }
    }
    
    
}

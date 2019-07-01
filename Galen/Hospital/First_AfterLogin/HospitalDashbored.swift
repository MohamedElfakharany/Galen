//
//  HospitalDashbored.swift
//  Galen
//
//  Created by elfakharany on 4/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class HospitalDashbored: UIViewController , UITableViewDelegate , UITableViewDataSource {
    
    var TicketsArray = [Ticket]()
    var DoctorArray = [String]()
    
    static let notificationName = Notification.Name("myNotificationName")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DoctorArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as? HospitalDoctorTableViewCell
        print([DoctorArray])
        let CurrentDoctor = self.DoctorArray[indexPath.row]
        var CurrentSpeciality = ""
        var CurrentDoctorAppoinments = [Ticket]()
        
        for wticket in TicketsArray {
            if (wticket.selectedDoctor?.name)! == CurrentDoctor {
                CurrentSpeciality = wticket.selectedSpecialty?.name ?? ""
            }
        }
        
        for wticket in TicketsArray {
            if wticket.selectedDoctor?.name == CurrentDoctor {
                CurrentDoctorAppoinments.append(wticket)
           //     print(CurrentDoctorAppoinments)
            }
        }
        
        
        cell?.EditCell(
            DoctorName: CurrentDoctor ,
            DoctorSepciality: CurrentSpeciality ,
            cDoctorTickets: CurrentDoctorAppoinments)
        
        cell?.CollectionView.reloadData()
        
        return cell!
    }
    
    @IBOutlet weak var TableView: UITableView!
    
    lazy var Refresher : UIRefreshControl  = {
        let Refresher = UIRefreshControl()
        Refresher.addTarget(self, action: #selector(GetTickets), for: .valueChanged)
        
        return Refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
        UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
        UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
        ])
        GetTickets()
        self.TableView.delegate = self
        self.TableView.dataSource = self
        TableView.addSubview(Refresher)
    }
    
    
    @objc func GetTickets(){
        self.Refresher.endRefreshing()
//        let parameters: Parameters = [
//            "where":
//                [
//                    "selected_hospital.id" : 20
//            ]
//        ]
//
        Alamofire.request(URLs.allTickets, method: .post, encoding: JSONEncoding.default, headers: nil) .responseData { response in
            print(response.result)
            print(response.request)
            switch response.result
            {
            case .success(let value):
                let json = JSON(value).dictionary
                do {
                    let datas = try json!["list"]?.rawData()
                    print(datas)
                    do {
                    //    let TicketData = try? newJSONDecoder().decode([Ticket].self, from: datas!)
                      //  self.TicketsArray = TicketData!
                        NotificationCenter.default.post(name:
                            NSNotification.Name("hello"), object: nil)
                        
                        self.TableView.reloadData()
                        
//                        for wticket in self.TicketsArray {
//                            if self.DoctorArray.contains(wticket.selectedDoctor?.name ?? "") {
//                            }else{
//                                self.DoctorArray.append(wticket.selectedDoctor?.name ?? "")
//                            }
//                        }
                        
                  
                      print(self.DoctorArray)
                        
                         self.TableView.reloadData()
                    }
                } catch  {
                }
                
                
            case .failure(_):
                print("Failure")
            }
        }
    }
    
    
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

//
//  HospitalDashbored.swift
//  Galen
//
//  Created by elfakharany on 4/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit


class HospitalDashbored: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    lazy var Refresher : UIRefreshControl  = {
        let Refresher = UIRefreshControl()
        Refresher.addTarget(self, action: #selector(GetTickets), for: .valueChanged)
        
        return Refresher
    }()
    var TicketsArray = [Ticket]()
    var DoctorArray = [String]()
    static let notificationName = Notification.Name("myNotificationName")
    var ticketPresenter: TicketPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
        UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
        UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
        ])
        
        ticketPresenter = TicketPresenter(delegate: self)
        GetTickets()
        TableView.delegate = self
        TableView.dataSource = self
        TableView.addSubview(Refresher)
    }
    
    
    @objc func GetTickets(){
        ticketPresenter.getAllTickets(params: nil)
    }
    
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension HospitalDashbored : UITableViewDelegate, UITableViewDataSource {
    
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
    
    
}


extension HospitalDashbored: TicketDelegate {
    
    func getAllTicketsDidSuccess() {
        Refresher.endRefreshing()
        TicketsArray = ticketPresenter.tickets
        TableView.reloadData()
    }
    
    func getAllTicketsDidFail(_ message: String) {
        Refresher.endRefreshing()
        showAlert(title: "Error", message: message)
    }
    
}

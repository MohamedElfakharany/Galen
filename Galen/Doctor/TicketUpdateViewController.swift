//
//  TicketUpdateViewController.swift
//  Galen
//
//  Created by elfakharany on 6/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class TicketUpdateViewController: UIViewController , UINavigationControllerDelegate {

    var TicketArrUpdate = [Ticket]()
    
    @IBOutlet weak var LblDetecationNumber: UILabel!
    @IBOutlet weak var LblDetecationDate: UILabel!
    
    @IBOutlet weak var LblDoctorCode: UILabel!
    @IBOutlet weak var LblDoctorName: UILabel!
    
    @IBOutlet weak var LblPatianName: UILabel!
    @IBOutlet weak var LblPatiantCode: UILabel!
    
    
    var MedicalReport : String = ""
    var MedicalReportImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // print("fisttc\(self.TicketArrUpdate.first)")
        
      //  self.navigationController?.delegate = self
        
        let CurrentTicket = TicketArrUpdate.first
        self.LblDoctorCode.text = "\(CurrentTicket?.selectedDoctor?.selectedDoctorID ?? 0 )"
        self.LblDoctorName.text = CurrentTicket?.selectedDoctor?.name
        self.LblPatianName.text = CurrentTicket?.addUserInfo?.name
        self.LblPatiantCode.text = "\(CurrentTicket?.addUserInfo?.id ?? 0 )"
        self.LblDetecationNumber.text = "\(CurrentTicket?.ticketID ?? 0)"
        self.LblDetecationDate.text = " \(CurrentTicket?.date ?? "")  \(CurrentTicket?.selectedTime?.from?.hour ?? 00 ) : \(CurrentTicket?.selectedTime?.from?.minute ?? 00 )"
         self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        print("medirepo\(MedicalReport)")
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .done, target: self, action: #selector(self.backToInitial(sender:)))
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
        // Do any additional setup after loading the view.
    }
    
    @objc func backToInitial(sender: AnyObject) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("medirepo\(MedicalReport)")
    }
    
    @IBAction func BtnActMedicalReport(_ sender: Any) {
    }
    @IBAction func BtnActListOfDrugs(_ sender: Any) {
    }
    @IBAction func BtnActRumors(_ sender: Any) {
    }
    @IBAction func BtnActAnalyze(_ sender: Any) {
    }
    
    
    func UpdateTicket(testpar:String){
        let url = "http://microtec1.egytag.com/api/tickets/update"
        
        let parametersx : Parameters = [
            "id" : 57 ,
            "notes" : "MyTest33"  ,
            "accessToken" : "00476995c1052d4b5dd62f117c9ae1a2"
        ]
        Alamofire.request(url, method: .post, parameters: parametersx, encoding: URLEncoding.default, headers: nil).responseJSON { (respone) in
            print("respose\(respone)")
        }
        
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        
     self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func BtnActConfirm(_ sender: Any) {
        
        UpdateTicket(testpar: "TestNO3")
    }
    @IBAction func BtnActReject(_ sender: Any) {
    }

}

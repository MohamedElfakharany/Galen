//
//  AppointmentDetailsVC2.swift
//  Galen
//
//  Created by elfakharany on 7/29/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppointmentDetailsVC2: UIViewController {

    @IBOutlet weak var LblTicketNumber: UILabel!
    @IBOutlet weak var LblDoctorCode: UILabel!
    @IBOutlet weak var LblPatientCode: UILabel!
    @IBOutlet weak var LblTicketTime: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblDoctorName: UILabel!
    @IBOutlet weak var LblPatientName: UILabel!
    
    @IBOutlet weak var BtnOutletReport: UIButton!
    @IBOutlet weak var BtnOutletDrugs: UIButton!
    @IBOutlet weak var BtnOutletRay: UIButton!
    @IBOutlet weak var BtnOutletAnalyses: UIButton!
    
    @IBOutlet weak var BtnOutletDetectionDone: UIButton!
    @IBOutlet weak var BtnOutletCancelReservation: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnOutletReport.layer.cornerRadius = 5
        BtnOutletReport.clipsToBounds = true
        
        BtnOutletDrugs.layer.cornerRadius = 5
        BtnOutletDrugs.clipsToBounds = true
        
        BtnOutletRay.layer.cornerRadius = 5
        BtnOutletRay.clipsToBounds = true
        
        BtnOutletAnalyses.layer.cornerRadius = 5
        BtnOutletAnalyses.clipsToBounds = true
        
        BtnOutletDetectionDone.layer.cornerRadius = 5
        BtnOutletDetectionDone.clipsToBounds = true
        
        BtnOutletCancelReservation.layer.cornerRadius = 5
        BtnOutletCancelReservation.clipsToBounds = true
        BtnOutletCancelReservation.layer.borderWidth = 1
        BtnOutletCancelReservation.layer.borderColor = #colorLiteral(red: 0.7529411765, green: 0.2235294118, blue: 0.168627451, alpha: 1)
        
    }
    
    @IBAction func BtnNotification(_ sender :Any) {
        
    }
    
}

//
//  ConfirmReservationFromDocDataVC2.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class ConfirmReservationFromDocDataVC2: UIViewController {
    
    //Doctor Data Outlet
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    
    // ticket outlet
    @IBOutlet weak var LblTicketDay: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblTicketPeriod: UILabel!
    
    // Buttons Outlet
    @IBOutlet weak var BtnReservationOutlet: UIButton!
    @IBOutlet weak var BtnPersentageCodeOutlet: UIButton!
    
    var passedDoctor: Doctor!
    var passedTicket: Ticket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // BTN reservation
        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
        
        // BTN PersentageCode
        BtnPersentageCodeOutlet.layer.borderWidth = 1.5
        BtnPersentageCodeOutlet.layer.cornerRadius = 5
        BtnPersentageCodeOutlet.clipsToBounds = true
        BtnPersentageCodeOutlet.layer.borderColor = #colorLiteral(red: 0.5464263558, green: 0.7691968083, blue: 0.2602422833, alpha: 1)
        
        populateDoctorInfo()
        populateTicketInfo()
    }
    
    func populateDoctorInfo(){
        
        LblDocName.text = "دكتور \(passedDoctor.name!)"
        LblDocSpeciality.text = passedDoctor!.specialty?.name
        LblDocAddress.text = passedDoctor!.clinic?.address
        LblDocPrice.text = " سعر الكشف : \(passedDoctor.fee ?? 0)"
        ratingView.rating = Double(passedDoctor!.rating ?? 0)
        
        let url = URL(string: "\(URLs.base)\(passedDoctor.imageURL ?? "")")
        DocImage.kf.indicatorType = .activity
        DocImage.kf.setImage(with: url)
    }
    
    func populateTicketInfo(){
        LblTicketDay.text = passedTicket.selectedTime?.day.ar
        
        var date = passedTicket.date!
        if let index = date.range(of: "T")?.lowerBound {
            let substring = date[..<index]
            date = String(substring)
        }
        LblTicketDate.text = date
        
        let from = "\(passedTicket.selectedTime?.from.hour ?? 0):\(passedTicket.selectedTime?.from.minute ?? 0)"
        let to = "\(passedTicket.selectedTime?.to.hour ?? 0):\(passedTicket.selectedTime?.to.minute ?? 0)"
        LblTicketPeriod.text = "من \(from) إلى \(to)"
    }
    
    
    
    @IBAction func BtnReservation(_ sender: Any) {
        //call ticket here
    }
    
    @IBAction func BtnPersentageCode(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "EnterPersentageCodeVC2") as! EnterPersentageCodeVC2
        //start delegate here
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

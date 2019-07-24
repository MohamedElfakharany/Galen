//
//  ConfirmReservationFromDocDataVC2.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ConfirmReservationFromDocDataVC2: UIViewController {
    
    //Doctor Data Outlet
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    
    @IBOutlet weak var StarLeft1: UIImageView!
    @IBOutlet weak var StarLeft2: UIImageView!
    @IBOutlet weak var StarLeft3: UIImageView!
    @IBOutlet weak var StarLeft4: UIImageView!
    @IBOutlet weak var StarLeft5: UIImageView!
    
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    
    // ticket outlet
    @IBOutlet weak var LblTicketDay: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblTicketPeriod: UILabel!
    
    // Buttons Outlet
    @IBOutlet weak var BtnReservationOutlet: UIButton!
    @IBOutlet weak var BtnPersentageCodeOutlet: UIButton!
    
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
        
    }
    @IBAction func BtnReservation(_ sender: Any) {
    }
    
    @IBAction func BtnPersentageCode(_ sender: Any) {
    }
    
    
}

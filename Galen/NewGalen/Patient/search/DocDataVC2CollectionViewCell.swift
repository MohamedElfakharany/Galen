//
//  DocDataVC2CollectionViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DocDataVC2CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var LblTicketDay: UILabel!
    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblTicketPeriod: UILabel!
    @IBOutlet weak var BtnReservationOutlet: UIButton!
    
    var makeReservation: (()->())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
    }
    
    
    func setupCell(_ ticket: Ticket){
        LblTicketDay.text = ticket.selectedTime?.day.ar
        
        var date = ticket.date!
        if let index = date.range(of: "T")?.lowerBound {
            let substring = date[..<index]
            date = String(substring)
        }
        LblTicketDate.text = date
        
        let from = "\(ticket.selectedTime?.from.hour ?? 0):\(ticket.selectedTime?.from.minute ?? 0)"
        let to = "\(ticket.selectedTime?.to.hour ?? 0):\(ticket.selectedTime?.to.minute ?? 0)"
        LblTicketPeriod.text = "من \(from) إلى \(to)"
    }
    
    
    @IBAction func BtnReservation(_ sender: Any) {
        makeReservation?()
    }
}

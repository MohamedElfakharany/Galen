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
    
    
    override func awakeFromNib() {
        self.awakeFromNib()
        
        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
        
    }
    
    @IBAction func BtnReservation(_ sender: Any) {
    }
}

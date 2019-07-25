//
//  SearchDocsResultsTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchDocsResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocRate: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocAvilability: UILabel!
    @IBOutlet weak var BtnReservationOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func BtnReservation(_ sender: Any) {
    }
    
}

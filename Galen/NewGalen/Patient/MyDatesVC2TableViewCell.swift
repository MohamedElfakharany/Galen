//
//  MyDatesVC2TableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class MyDatesVC2TableViewCell: UITableViewCell {

    @IBOutlet weak var LblDate: UILabel!
    @IBOutlet weak var LblTicketPeriod: UILabel!
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
//    BtnMapAddress
    @IBOutlet weak var BtnMapAddressOutlet : UIButton!
    @IBOutlet weak var BtnCancelOutlet : UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        BtnCancelOutlet.layer.cornerRadius = 5
        BtnCancelOutlet.clipsToBounds = true
        
        BtnMapAddressOutlet.layer.cornerRadius = 5
        BtnMapAddressOutlet.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    
    }
    
    @IBAction func BtnMapAddress(_ sender: Any) {
    }
    
    @IBAction func BtnCancel(_ sender: Any) {
    }
    
    
}

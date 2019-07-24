//
//  ApprovalListTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ApprovalListTableViewCell: UITableViewCell {

    @IBOutlet weak var ClincImage: UIImageView!
    
    @IBOutlet weak var LblClincName: UILabel!
    
    @IBOutlet weak var LblClincAddress: UILabel!
    
    @IBOutlet weak var LblOrderCode: UILabel!
    
    @IBOutlet weak var BtnConfirmationOutlet: UIButton!
    
    @IBOutlet weak var BtnRejectOutlet: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // BTN reservation
        BtnConfirmationOutlet.layer.cornerRadius = 5
        BtnConfirmationOutlet.clipsToBounds = true
        
        BtnRejectOutlet.layer.cornerRadius = 5
        BtnRejectOutlet.clipsToBounds = true
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func BtnConfirmation(_ sender: Any) {
        
    }
    
    @IBAction func BtnReject(_ sender: Any) {
        
    }
}

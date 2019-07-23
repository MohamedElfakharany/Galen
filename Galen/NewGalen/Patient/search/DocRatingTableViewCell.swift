//
//  DocRatingTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DocRatingTableViewCell: UITableViewCell {

    @IBOutlet weak var LblPatientName: UILabel!
    @IBOutlet weak var LblRatingDate: UILabel!
    @IBOutlet weak var TxtviewPatientReview: UITextView!
    @IBOutlet weak var imageLeft1: UIImageView!
    @IBOutlet weak var imageLeft2: UIImageView!
    @IBOutlet weak var imageLeft3: UIImageView!
    @IBOutlet weak var imageLeft4: UIImageView!
    @IBOutlet weak var imageLeft5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

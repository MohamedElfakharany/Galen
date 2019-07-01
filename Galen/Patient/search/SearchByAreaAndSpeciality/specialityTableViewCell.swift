//
//  specialityTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 6/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class specialityTableViewCell: UITableViewCell{

    @IBOutlet weak var imgSpeciality: UIImageView!
    @IBOutlet weak var LblSpeciality: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func initiateCell(image:UIImage , label:String){
        self.imgSpeciality.image = image
        self.LblSpeciality.text = label
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

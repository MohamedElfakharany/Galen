//
//  SelectGovsTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/15/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SelectGovsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var LblInsuranceCompanyName: UILabel!
    @IBOutlet weak var BtnCheckBox: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func inittiateCell(label:String ){
        self.LblInsuranceCompanyName.text = label
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

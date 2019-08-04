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
    
    func setupCell(gov: City){
        LblInsuranceCompanyName.text = gov.name
    }

}

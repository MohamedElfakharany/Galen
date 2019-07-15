//
//  InsuranceCompanyTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class InsuranceCompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgInsuranceCompany: UIImageView!
    @IBOutlet weak var LblInsuranceCompanyName: UILabel!
    @IBOutlet weak var BtnCheckBox: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func inittiateCell(image:UIImage , label:String ){
        self.imgInsuranceCompany.image = image
        self.LblInsuranceCompanyName.text = label
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

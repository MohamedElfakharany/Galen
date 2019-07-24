//
//  AuthInsuranceCompaniesVC2TableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AuthInsuranceCompaniesVC2TableViewCell: UITableViewCell {
    
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

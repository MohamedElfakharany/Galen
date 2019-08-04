//
//  InsuranceCompanyTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Kingfisher

class InsuranceCompanyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgInsuranceCompany: UIImageView!
    @IBOutlet weak var LblInsuranceCompanyName: UILabel!
    @IBOutlet weak var BtnCheckBox: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setupCell(company: InsuranceCompany){
        
        LblInsuranceCompanyName.text = company.name
        
        let url = URL(string: "\(URLs.base)\(company.imageURL ?? "")")  
        imgInsuranceCompany.kf.indicatorType = .activity
        imgInsuranceCompany.kf.setImage(with: url)
    }
    
    func inittiateCell(image:UIImage , label:String ){
        self.imgInsuranceCompany.image = image
        self.LblInsuranceCompanyName.text = label
    }

}

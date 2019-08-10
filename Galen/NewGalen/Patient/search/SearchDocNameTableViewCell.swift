//
//  SearchDocNameTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Kingfisher

class SearchDocNameTableViewCell: UITableViewCell {

    
    @IBOutlet weak var doctorAvatar: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        doctorAvatar.clipsToBounds = true 
        doctorAvatar.layer.cornerRadius = doctorAvatar.frame.width/2
    }
    
    func setupCell(doctor: Doctor){
        
        LblDocName.text = doctor.name
        
        let url = URL(string: "\(URLs.base)\(doctor.imageURL ?? "")")
        doctorAvatar.kf.indicatorType = .activity
        let image = UIImage(named: "manChoose")
        doctorAvatar.kf.setImage(with: url, placeholder: image)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

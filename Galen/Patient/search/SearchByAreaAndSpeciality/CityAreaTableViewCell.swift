//
//  CityAreaTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 6/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class CityAreaTableViewCell: UITableViewCell {


    @IBOutlet weak var LblCityAreaName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func ConfigurationCell( name : String){
        self.LblCityAreaName.text = name
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

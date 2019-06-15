//
//  searchDoctorResults.swift
//  Galen
//
//  Created by elfakharany on 4/26/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class searchDoctorResults: UICollectionViewCell {
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var DetectionPrice: UILabel!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docSoecialty: UILabel!
    @IBOutlet weak var docAvailabilty: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

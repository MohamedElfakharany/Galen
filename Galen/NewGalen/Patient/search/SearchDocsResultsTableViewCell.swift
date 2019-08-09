//
//  SearchDocsResultsTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Kingfisher

class SearchDocsResultsTableViewCell: UITableViewCell {

    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocRate: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var LblDocAvilability: UILabel!
    @IBOutlet weak var BtnReservationOutlet: UIButton!
    
    
    var makeReservation: (()->())?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
        selectionStyle = .none
    }
    
    func setupCell(_ doc: Doctor){
        
        LblDocName.text = doc.name
        LblDocRate.text = "\(doc.rating ?? 0)"
        LblDocSpeciality.text = doc.specialty?.name
        LblDocAddress.text = doc.clinic?.address
        LblDocPrice.text = " سعر الكشف : \(doc.fee ?? 0)"
//        LblDocAvilability.text = doc.
        
        let url = URL(string: "\(URLs.base)\(doc.imageURL ?? "")")
        DocImage.kf.indicatorType = .activity
        DocImage.kf.setImage(with: url)
    }
   
    @IBAction func BtnReservation(_ sender: Any) {
        makeReservation?()
    }
    
}

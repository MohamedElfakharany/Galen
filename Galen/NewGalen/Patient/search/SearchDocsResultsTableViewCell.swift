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

        selectionStyle = .none

        BtnReservationOutlet.layer.cornerRadius = 5
        BtnReservationOutlet.clipsToBounds = true
        DocImage.clipsToBounds = true
        DocImage.layer.cornerRadius = DocImage.frame.width/2
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
        let image = UIImage(named: "manChoose")
        DocImage.kf.setImage(with: url, placeholder: image)
    }
   
    @IBAction func BtnReservation(_ sender: Any) {
        makeReservation?()
    }
    
}

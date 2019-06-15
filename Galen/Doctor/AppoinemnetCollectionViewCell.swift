//
//  AppoinemnetCollectionViewCell.swift
//  Galen
//
//  Created by elfakharany on 5/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppoinemnetCollectionViewCell: UICollectionViewCell {
    
    override func awakeFromNib() {
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        self.layer.shadowRadius = 3.5
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
    @IBOutlet weak var LblDay: UILabel!
    @IBOutlet weak var LblDate: UILabel!
    @IBOutlet weak var LblTime: UILabel!
    @IBOutlet weak var LblStatues: UIButton!
    
    
    
    func EditCell (  Day : String , Date : String , Time : String , Statues : String , StatuesColor : UIColor    ){
        
        self.LblDay.text = Day
        self.LblStatues.setTitle(Statues, for: .normal)
        self.LblTime.text = Time
        self.LblDate.text = Date
        self.LblStatues.backgroundColor = StatuesColor
    }
    
    @IBAction func BtnSelectStatues(_sender :UIButton){
        
       
        
    }
    
    
}

//
//  searchCityGovVC.swift
//  Galen
//
//  Created by elfakharany on 6/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class searchCityGovVC: UIViewController {
    
    @IBOutlet weak var TextFieldCityName: UITextField!
    @IBOutlet weak var AllGovernorates: UITextField!
    
    @IBOutlet weak var BtnSearch: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func imageText() {
        // city name
        if let myImage = UIImage(named: "search"){
            
            TextFieldCityName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TextFieldCityName.MakeRoundeEdges(TextFieldCityName)
            TextFieldCityName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        
        // All Governorates
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            AllGovernorates.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            AllGovernorates.MakeRoundeEdges(AllGovernorates)
            AllGovernorates.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
    }
}

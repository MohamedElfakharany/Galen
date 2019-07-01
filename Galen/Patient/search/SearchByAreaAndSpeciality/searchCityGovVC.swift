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
        
        imageText()
        gradBTNS()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
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
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = BtnSearch.bounds
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        BtnSearch.layer.insertSublayer(gradientLayer, at: 0)
        BtnSearch.layer.cornerRadius = BtnSearch.frame.height/2
        BtnSearch.clipsToBounds = true
    }
}

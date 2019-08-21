//
//  HFirstVC2.swift
//  Galen
//
//  Created by elfakharany on 8/3/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HFirstVC2: UIViewController {
    
    @IBOutlet weak var BackView1:UIView!
    @IBOutlet weak var BackView2:UIView!
    @IBOutlet weak var BackView3:UIView!
    
    @IBOutlet weak var BtnOutletDefinition:UIButton!
    @IBOutlet weak var BtnOutletCreateDoc:UIButton!
    @IBOutlet weak var BtnOutletDashboard:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackView1.layer.cornerRadius = 5
        BackView1.clipsToBounds = true
        
        BackView2.layer.cornerRadius = 5
        BackView2.clipsToBounds = true
        
        BackView3.layer.cornerRadius = 5
        BackView3.clipsToBounds = true
        
        BtnOutletDefinition.layer.cornerRadius = 5
        BtnOutletDefinition.clipsToBounds = true
        
        BtnOutletCreateDoc.layer.cornerRadius = 5
        BtnOutletCreateDoc.clipsToBounds = true
        
        BtnOutletDashboard.layer.cornerRadius = 5
        BtnOutletDashboard.clipsToBounds = true
        
        
        
    }
    
    @IBAction func BtnNotification(_ sender :Any) {
        
    }
    
}

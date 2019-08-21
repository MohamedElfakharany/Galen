//
//  DocFirstVC2.swift
//  Galen
//
//  Created by elfakharany on 8/1/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DocFirstVC2: UIViewController {
    
    @IBOutlet weak var BackView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackView.layer.cornerRadius = 5
        BackView.clipsToBounds = true
    }
    
    @IBAction func BtnNotification(_ sender :Any) {
        
    }
    
}

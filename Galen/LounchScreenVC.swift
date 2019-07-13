//
//  LounchScreenVC.swift
//  Galen
//
//  Created by elfakharany on 7/2/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class LounchScreenVC: UIViewController {
    
    @IBOutlet weak var logoImage:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        logoImage.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1, delay : 0.0, options :[] ,  animations: {
            self.logoImage.alpha = 1.0
        } ,completion : nil)
        
    }
    
}

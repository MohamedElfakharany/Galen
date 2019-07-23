//
//  CustomTabBarController.swift
//  Galen
//
//  Created by elfakharany on 7/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        var tabFrame:CGRect = self.tabBar.frame
        tabFrame.origin.y = self.view.frame.origin.y
        self.tabBar.frame = tabFrame
    }
    
}

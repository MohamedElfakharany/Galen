//
//  CustomTabBarController.swift
//  Galen
//
//  Created by elfakharany on 7/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController ,UITabBarControllerDelegate{
    
    override func viewDidLayoutSubviews() {
        tabBar.frame = CGRect(x: 0, y: 0, width: tabBar.frame.size.width, height: tabBar.frame.size.height)
        super.viewDidLayoutSubviews()
        delegate = self
        selectedViewController?.view.frame.origin = CGPoint(x: 0, y: tabBar.frame.size.height)
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        selectedViewController?.view.frame.origin = CGPoint(x: 0, y: tabBar.frame.size.height)
    }
    
}

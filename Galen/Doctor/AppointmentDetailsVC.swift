//
//  AppointmentDetailsVC.swift
//  Galen
//
//  Created by elfakharany on 5/27/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AppointmentDetailsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = false
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
        navigationController?.delegate = self as? UINavigationControllerDelegate
        
        
    }
    
    
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController.isKind(of:PopUpViewController.self) {
            navigationController.popToRootViewController(animated: animated)
        }
    }
 
}

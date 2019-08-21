//
//  HEditWorkingTimeVC2.swift
//  Galen
//
//  Created by elfakharany on 8/20/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HEditWorkingTimeVC2: UIViewController {
    
    @IBOutlet weak var TxtFieldSpeciality: UITextField!
    //saturday
    @IBOutlet weak var TxtFiledSatStart: UITextField!
    @IBOutlet weak var TxtFiledSatEnd: UITextField!
    // sunday
    @IBOutlet weak var TxtFiledSunStart: UITextField!
    @IBOutlet weak var TxtFiledSunEnd: UITextField!
    // monday
    @IBOutlet weak var TxtFiledMonStart: UITextField!
    @IBOutlet weak var TxtFiledMonEnd: UITextField!
    // Tuesday
    @IBOutlet weak var TxtFiledTuesStart: UITextField!
    @IBOutlet weak var TxtFiledTuesEnd: UITextField!
    // wednesday
    @IBOutlet weak var TxtFiledWedStart: UITextField!
    @IBOutlet weak var TxtFiledWedEnd: UITextField!
    // Thursday
    @IBOutlet weak var TxtFiledThursStart: UITextField!
    @IBOutlet weak var TxtFiledThursEnd: UITextField!
    // Friday
    @IBOutlet weak var TxtFiledFriStart: UITextField!
    @IBOutlet weak var TxtFiledFriEnd: UITextField!
    
    
    @IBOutlet weak var BtnCancelOutlet: UIButton!
    @IBOutlet weak var BtnSaveOutlet: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSaveOutlet.layer.cornerRadius = 5
        BtnSaveOutlet.clipsToBounds = true
        
        BtnCancelOutlet.layer.cornerRadius = 5
        BtnCancelOutlet.clipsToBounds = true
        BtnCancelOutlet.layer.borderWidth = 1
        BtnCancelOutlet.layer.borderColor = #colorLiteral(red: 0.7529411765, green: 0.2235294118, blue: 0.168627451, alpha: 1)
        
        
    }
    
    @IBAction func BtnSaveAction(_ sender: Any) {
    }
    
    @IBAction func BtnCancelAction(_ sender: Any) {
    }
    
    @IBAction func BtnNotification(_ sender: Any) {
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func BtnSaturday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func BtnSunday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func BtnMonday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func BtnTuesday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func Btnwednesday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func BtnThursday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    @IBAction func BtnFriday(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear
            , animations: {
                sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        }) { (success) in
            sender.isSelected = !sender.isSelected
            UIView.animate(withDuration: 0.25, delay: 0.1, options: .curveLinear, animations: {
                sender.transform = .identity
            }, completion: nil)
        }
    }
    
    
    
    
    
    
    
}

//
//  UpdateTicketDetailsViewController.swift
//  Galen
//
//  Created by elfakharany on 6/8/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class UpdateTicketDetailsViewController: UIViewController {

    @IBOutlet weak var TxtFiedlRepor: UITextView!
    @IBOutlet weak var ImageViewReport: UIImageView!
    
    var MediRepoString : String = ""
    var MediRepoimg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        TxtFiedlRepor.text = "Write Report"
        TxtFiedlRepor.textColor = UIColor.lightGray
        
    }
 
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        if segue.identifier == "ToUpdateDetails"  {
            
            if let navController = segue.destination as? UINavigationController {
                
                if let childVC = navController.topViewController as? TicketUpdateViewController {
                    //TODO: access here chid VC  like childVC.yourTableViewArray = localArrayValue
                    childVC.MedicalReport = TxtFiedlRepor.text
                    
                }
                
            }
            
        }
        
    }

    
    
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated);
        if self.isMovingFromParent
        {
            //On click of back or swipe back
            
            if TxtFiedlRepor.text !=  nil ||  TxtFiedlRepor.text != "Write Report" {
                self.MediRepoString = TxtFiedlRepor.text
            }
            
            
        }
        if self.isBeingDismissed
        {
            //Dismissed
        }
    }
    
    
    @IBAction func BtnAddPhoto(_ sender: Any) {
    }
    
    func textViewDidBeginEditing(_ TxtFiedlRepor: UITextView) {
        if TxtFiedlRepor.textColor == UIColor.lightGray {
            TxtFiedlRepor.text = ""
            TxtFiedlRepor.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ TxtFiedlRepor: UITextView) {
        if TxtFiedlRepor.text.isEmpty {
            TxtFiedlRepor.text = "Write Report"
            TxtFiedlRepor.textColor = UIColor.lightGray
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

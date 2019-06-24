//
//  PopUpViewController.swift
//  Galen
//
//  Created by elfakharany on 5/31/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var LblTicketDate: UILabel!
    @IBOutlet weak var LblPatianetName: UILabel!
    
    @IBOutlet weak var ViewPopUp: UIView!
    
    var TicketArr = [Ticket]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
    
        // Do any additional setup after loading
        self.LblPatianetName.text = TicketArr[0].selectedDoctor!.name
        self.LblTicketDate.text = TicketArr[0].date
        
        
        self.navigationController?.navigationBar.backgroundColor = UIColor(red: 23, green: 23, blue: 23, alpha: 0)
        //UIViewController.modalPresentationStyle = UIModalPresentationOverCurrentContext
        self.presentedViewController?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoUpdate" {
            let SelectedTicket = TicketArr.first
            let controller = segue.destination as! TicketUpdateViewController
            controller.TicketArrUpdate.insert(SelectedTicket!, at: 0) //error
        }
    }
    
    
    @IBAction func BtnReportAction(_ sender: Any) {
          self.performSegue(withIdentifier: "GoUpdate", sender: nil)
      
        
//        let storyBoard: UIStoryboard = UIStoryboard(name: "Doctor", bundle: nil)
//          let SelectedTicket = TicketArr.first
//        let newViewController = storyBoard.instantiateViewController(withIdentifier: "TicketUpdateViewController") as? TicketUpdateViewController
//        newViewController?.TicketArrUpdate.insert(SelectedTicket!, at: 0)
//        self.navigationController?.pushViewController(newViewController!, animated: true)
//      //  self.present(newViewController!, animated: true, completion: nil)
        
        
        
//        let controller = storyboard?.instantiateViewController(withIdentifier: "TicketUpdateViewController") as? TicketUpdateViewController
//        let SelectedTicket = TicketArr.first
//     //   let controller = segue.destination as! TicketUpdateViewController
//        controller?.TicketArrUpdate.insert(SelectedTicket!, at: 0)
//        self.navigationController!.pushViewController(controller!, animated: true)
        
    }
    
    @IBAction func BtnActReject(_ sender: Any) {
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

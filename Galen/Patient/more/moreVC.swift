//
//  moreVC.swift
//  Galen
//
//  Created by elfakharany on 3/26/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class moreVC: UIViewController {

    @IBOutlet weak var logoutBtnOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        gradBTNS()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])

    }

    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = logoutBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        logoutBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        logoutBtnOutlet.layer.cornerRadius = 5
        logoutBtnOutlet.clipsToBounds = true
    }
    
    
    @IBAction func logoutBtnAction(_ sender: Any) {
        
        let url = "http://microtec1.egytag.com:30001/api/user/logout"
        
        let accessTokenObject = ["access_token" : helper.getAPIToken()]
        
        let parameters : Parameters = [
            "Cookie" : accessTokenObject
            ]
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (DataResponse) in
            print( DataResponse.response )
         
            
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewController = storyBoard.instantiateViewController(withIdentifier: "FirstVC")
            self.present(newViewController, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func backBtn(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
}

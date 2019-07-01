//
//  SearchByAreaAndSpecialityVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SearchSpecialityVC: UIViewController{

    var DocSpecialties:[String] = []
    
    @IBOutlet weak var Specialties: UITextField!
    @IBOutlet weak var BtnSearch: UIButton!
    
    var selectedSpecialit = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageText()
        gradBTNS()
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }

    //////////ENDBTNACTFORPICKERS
    
    @IBAction func BtnActAutoLocate(_ sender: Any) {
        
        
    }
    func imageText() {

        // Specialties
        if let myImage = UIImage(named: "selectbox-downarrow"){
            
            Specialties.withImage(direction: .Right, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            Specialties.MakeRoundeEdges(Specialties)
            Specialties.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
       
    }
    
    func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = BtnSearch.bounds
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        BtnSearch.layer.insertSublayer(gradientLayer, at: 0)
        BtnSearch.layer.cornerRadius = BtnSearch.frame.height/2
        BtnSearch.clipsToBounds = true
    }
    
    @IBAction func BackBTN(_ sender: Any) {
        dismiss(animated: true , completion : nil)
    }
    
    
    // keybord down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

//
//  PatiantSearchForDoctorVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class PatiantSearchForDoctorViewController: UIViewController {
    
    @IBOutlet weak var BtnSearchByDoctorName: UITextField!
    @IBOutlet weak var BtnSearchByAreaAndSpeaciality: UITextField!
    
    /*@IBAction func BtnSearchByAreaANDSpecialty(_ sender: Any) {
    }
    @IBAction func BtnSearchByDoctorName(_ sender: Any) {
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        MakeTextFieldWithImage()
        
        MakeRoundeEdges(View: BtnSearchByDoctorName)
        MakeRoundeEdges(View: BtnSearchByAreaAndSpeaciality)
        

        setGradBackGround(
            colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnSearchByDoctorName)
        
        setGradBackGround(
            colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnSearchByAreaAndSpeaciality)
        
    }
    
    func MakeRoundeEdges(View : UIView){
        View.layer.cornerRadius = 10
        View.clipsToBounds = true
    }
    
    func setGradBackGround( colorOne : UIColor , colortwo : UIColor , Gradintview : UIView) {
        let gradintLayer = CAGradientLayer()
        gradintLayer.frame = Gradintview.bounds
        gradintLayer.colors = [colorOne.cgColor , colortwo.cgColor]
        gradintLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradintLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
        Gradintview.layer.insertSublayer(gradintLayer, at: 0)
    }
    
    
    
    func MakeTextFieldWithImage() {
        
        if let SearchBySpeciality = UIImage(named: "doctor-healthcare") {
            
            BtnSearchByAreaAndSpeaciality.withImage(direction: .Left, image: SearchBySpeciality, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
        if let SearchByDoctorName = UIImage(named: "nav-search"){
            
            BtnSearchByDoctorName.withImage(direction: .Left, image: SearchByDoctorName, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
        }
    }
    
    
}

//
//  SearchByAreaAndSpecialityVC.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchByAreaAndSpecialityViewController: UIViewController {
    
    @IBOutlet weak var BtnAutoLocate: UIButton!
    @IBOutlet weak var BtnSelectGovernate: UIButton!
    
    @IBOutlet weak var TextFieldCityName: UITextField!
    
    @IBOutlet weak var BtnAllGovernate: UIButton!
    @IBOutlet weak var PickerAllGovernate: UIPickerView!
    
    @IBOutlet weak var BtnSpecailaity: UIButton!
    @IBOutlet weak var PickerSpecailaity: UIPickerView!
    
    @IBOutlet weak var BtnIncurnaceCopamny: UIButton!
    @IBOutlet weak var pickerInsurnaceCompany: UIPickerView!
    
    @IBOutlet weak var BtnSearch: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        circularShapes(Shape: BtnAutoLocate)
        setGradBackGround(
            colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnAutoLocate)
        
        circularShapes(Shape: BtnAutoLocate)
        self.BtnSelectGovernate.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        setGradBackGround(
            colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnSearch)
        
        self.PickerSpecailaity.isHidden = true
        self.pickerInsurnaceCompany.isHidden = true
        self.PickerAllGovernate.isHidden = true
        
        setGradBackGround(
            colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: (self.navigationController?.navigationBar)!)
        
    }
    
    ////VIEWS FUNC
    func circularShapes (Shape : UIView){
        Shape.layer.cornerRadius = Shape.layer.frame.width / 2
        Shape.clipsToBounds = true
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
    ///////ENDVIEWSFUNC
    
    //////BtnForPICKERS
    @IBAction func BtnActAllGovernates(_ sender: Any) {
        if (self.PickerAllGovernate.isHidden == false) {
            self.PickerAllGovernate.isHidden = true
        }else{
            self.PickerAllGovernate.isHidden = false
        }
    }
    
    @IBAction func BtnActSpeciality(_ sender: Any) {
        
        if (self.PickerSpecailaity.isHidden == false) {
            self.PickerSpecailaity.isHidden = true
        }else{
            self.PickerSpecailaity.isHidden = false
        }
    }
    
    @IBAction func btnActInsurnaceCopany(_ sender: Any) {
        if (self.pickerInsurnaceCompany.isHidden == false) {
            self.pickerInsurnaceCompany.isHidden = true
        }else{
            self.pickerInsurnaceCompany.isHidden = false
        }
        
    }
    //////////ENDBTNACTFORPICKERS
    
    @IBAction func BtnActAutoLocate(_ sender: Any) {
        
        if (self.BtnAutoLocate.backgroundColor == #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)){
            setGradBackGround(
                colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnAutoLocate)
            self.BtnSelectGovernate.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            self.BtnAutoLocate.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            setGradBackGround(
                colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnSelectGovernate)
        }
    }
    @IBAction func btnActSelectGovernate(_ sender: Any) {
        
        if (self.BtnSelectGovernate.backgroundColor == #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)){
            setGradBackGround(
                colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnSelectGovernate)
            self.BtnAutoLocate.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }else{
            self.BtnSelectGovernate.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            setGradBackGround(
                colorOne: UIColor.init(red: 86.0, green: 177.0, blue: 210, alpha: 1.0) , colortwo: UIColor.init(red: 86, green: 229, blue: 167, alpha: 1.0), Gradintview: self.BtnAutoLocate)
        }
        
    }
    
}

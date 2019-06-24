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

class SearchSpecialityVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate {

    var pickerView = UIPickerView()
    var ICsNames:[String] = []
    var Governorates:[String] = []
    var DocSpecialties:[String] = []
    var VarSelectedpicker=0
    var selectedTxtField = UITextField()
    
    @IBOutlet weak var Specialties: UITextField!

    @IBOutlet weak var BtnSearch: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Governorates = ["dahab","cairo","alex","kfs","ismailia","suez","por said","sharm","hurghada"]
        ICsNames = ["one","two","three","four","five","six"]
        DocSpecialties = ["General Surgery","Neurosurgery","Radiology","Emergency Medicine","Optometrists"]
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if selectedTxtField == AllGovernorates {
//            return Governorates.count
//        }
         if selectedTxtField == Specialties{
            return DocSpecialties.count
        }else  {
            return ICsNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if selectedTxtField == Governorates{
//            VarSelectedpicker = row
//            return Governorates[row]
//        }else
        if selectedTxtField == Specialties {
            VarSelectedpicker = row
            return DocSpecialties[row]
        }else{
            VarSelectedpicker = row
            return ICsNames[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        if  selectedTxtField == Governorates {
//            Governorates.text = Governorates[row]
//            self.view.endEditing(true)
//        }else
        if selectedTxtField == Specialties {
            Specialties.text = DocSpecialties[row]
            self.view.endEditing(true)
        }else {
           // InsuranceCompanies.text = ICsNames[row]
            self.view.endEditing(true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        selectedTxtField = textField
//        if selectedTxtField == Governorates{
//            selectedTxtField.inputView = pickerView
//        }else
        if selectedTxtField == Specialties {
            selectedTxtField.inputView  = pickerView
        }else {
            selectedTxtField.inputView  = pickerView
        }
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

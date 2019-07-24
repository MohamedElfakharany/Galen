//
//  SearchVC2.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchVC2: UIViewController ,UIPickerViewDelegate ,UIPickerViewDataSource , UITextFieldDelegate{
    
    var pickerView = UIPickerView()
    private var PickerSpeciality: UIPickerView?
    var selectedTxtField = UITextField()
    var selectedSpeciality = String()
    var Speciality:[String] = []
    @IBOutlet weak var TxtfieldSearchSpeciality: UITextField!
    @IBOutlet weak var BtnSearchOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSearchOutlet.layer.cornerRadius = 5
        BtnSearchOutlet.clipsToBounds = true
        
        Speciality = ["طب الباطنة","طب الاسنان","طب الجراحة ","طب العيون","طب الاورام","طب الروماتزم"]
        PickerSpeciality = UIPickerView()
        TxtfieldSearchSpeciality.inputView = PickerSpeciality
        
        
    }
    
    @IBAction func BtnAutoSelect(_ sender: UIButton) {
        
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
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Speciality.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == TxtfieldSearchSpeciality {
            return Speciality[row]
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTxtField == TxtfieldSearchSpeciality {
            TxtfieldSearchSpeciality.text = Speciality[row]
            self.selectedSpeciality = Speciality[row]
            self.view.endEditing(true)
        }
        return
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        selectedTxtField = textField
        if selectedTxtField == TxtfieldSearchSpeciality{
            TxtfieldSearchSpeciality.inputView = pickerView
        }
    }
    // keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

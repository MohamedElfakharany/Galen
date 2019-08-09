//
//  SearchVC2.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchVC2: UIViewController {
    
    @IBOutlet weak var TxtfieldSearchSpeciality: UITextField!
    @IBOutlet weak var BtnSearchOutlet: UIButton!
    @IBOutlet weak var searchGovsBtn: UIButton!
    @IBOutlet weak var searchInsuranceBtn: UIButton!
    
    var pickerView = UIPickerView()
    private var PickerSpeciality: UIPickerView?
    var selectedTxtField = UITextField()
    var selectedSpeciality : String?
    var presenter: SpecialityPresenter!
    var hospitalPresenter: HospitalPresenter!
    var chosenGov: City?
    var chosenInsurance: InsuranceCompany?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BtnSearchOutlet.layer.cornerRadius = 5
        BtnSearchOutlet.clipsToBounds = true
        presenter = SpecialityPresenter(delegate: self)
        presenter.getAllSpecialities()
        PickerSpeciality = UIPickerView()
        TxtfieldSearchSpeciality.inputView = PickerSpeciality
        hospitalPresenter = HospitalPresenter(delegate: self)
    }
    
    
    @IBAction func searchGovsBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchGovernatesVC2") as! SearchGovernatesVC2
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func searchInsuranceBtnPressed(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchInsuranceResultVC2") as! SearchInsuranceResultVC2
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
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
    
    // keyboard down
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    @IBAction func searchBtnPressed(_ sender: Any) {
        calculateSearchParameters()
    }
    
    
    func calculateSearchParameters(){
        
        let parameters : [String : Any] = [
            "where" : [
                "gov": [
                    "id": chosenGov?.cityID
                ],
                "insurance_company":[
                    "id": chosenInsurance?.companyID
                ]
                ],
                "search_doctor": selectedSpeciality
            ]

        hospitalPresenter.getAllHospitals(params: parameters)
    }
    
    
}


extension SearchVC2: UIPickerViewDelegate ,UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return presenter.specialities.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if selectedTxtField == TxtfieldSearchSpeciality {
            return presenter.specialities[row].name
        }
        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if selectedTxtField == TxtfieldSearchSpeciality {
            TxtfieldSearchSpeciality.text = presenter.specialities[row].name
            self.selectedSpeciality = presenter.specialities[row].name
            self.view.endEditing(true)
        }
        return
    }
}


extension SearchVC2 : UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView.delegate = self
        self.pickerView.dataSource  = self
        selectedTxtField = textField
        if selectedTxtField == TxtfieldSearchSpeciality{
            TxtfieldSearchSpeciality.inputView = pickerView
        }
    }
}


extension SearchVC2 : SpecialityDelegate {
    
    func getAllSpecialitiesDidSuccess() {
        pickerView.reloadAllComponents()
    }
    
    func getAllSpecialitiesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}


protocol SearchDoctorDelegate: class {
    func didChoseGovernorate(gov: City, viewController: UIViewController)
    func didChoseInsurance(company: InsuranceCompany, viewController: UIViewController)
}


extension SearchVC2: SearchDoctorDelegate {
    
    func didChoseGovernorate(gov: City, viewController: UIViewController) {
        chosenGov = gov
        searchGovsBtn.setTitle(chosenGov?.name, for: .normal)
        viewController.navigationController?.popViewController(animated: true)
    }
    
    func didChoseInsurance(company: InsuranceCompany, viewController: UIViewController) {
        chosenInsurance = company
        searchInsuranceBtn.setTitle(chosenInsurance?.name, for: .normal)
        viewController.navigationController?.popViewController(animated: true)
    }
    
    
}


extension SearchVC2: HospitalDelegate {
    
    func getAllHospitalsDidSuccess() {
        
        var doctors = [Doctor]()
        for hospital in hospitalPresenter.hospitals {
            if let doctorList = hospital.doctorList {
                for list in doctorList {
                    if let doctor = list.doctor {
                        doctors.append(doctor)
                    }
                }
            }
        }
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SearchDocsResultsVC2") as! SearchDocsResultsVC2
        vc.doctors = doctors
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func getAllHospitalsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }

}

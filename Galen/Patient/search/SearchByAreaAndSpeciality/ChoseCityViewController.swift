//
//  ChoseCityViewController.swift
//  Galen
//
//  Created by elfakharany on 6/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ChoseCityViewController: UIViewController {
   
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var TxtFieldCityName: UITextField!
    @IBOutlet weak var TxtFieldGov: UITextField!
    @IBOutlet weak var DoneBtnOutlet: UIButton!
    
    var SelectedSpecaility = [Speciality]()
    var CityArray = [City]()
    var AreaArray = [City]()
    var CityAlreadyChosed = false
    var SelectedCityId = 0
    var SelectedAreaId  = 0
    var govPresenter: GovernoratePresenter!
    var cityPresenter: CityPresenter!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        govPresenter = GovernoratePresenter(delegate: self)
        cityPresenter = CityPresenter(delegate: self)
        
        print(SelectedSpecaility)
        let selectedSpecialityID = SelectedSpecaility[0].specialityID
        
        imageText()
        gradBTNS()
        
        CityAlreadyChosed = false
        self.TxtFieldGov.delegate = self
        
        tableview.delegate = self
        tableview.dataSource = self
        govPresenter.getAllGovs()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }
    
    /////////textfield images/////////
    func imageText() {
        
        if let myImage = UIImage(named: "user"){
            
            TxtFieldGov.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldGov.MakeRoundeEdges(TxtFieldGov)
            TxtFieldGov.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
        }
        if let myImage = UIImage(named: "password"){
            
            TxtFieldCityName.withImage(direction: .Left, image: myImage, colorSeparator: UIColor.clear, colorBorder: UIColor.clear)
            
            TxtFieldCityName.MakeRoundeEdges(TxtFieldCityName)
            TxtFieldCityName.addShadowToTextField(color: UIColor.black, cornerRadius: 3)
            
        }
    }//EndImageText
    
    func gradBTNS() {
        
        let RightGradientColor =  #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)
        let LiftGradientColor =  #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)
        // Sign in BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = DoneBtnOutlet.bounds
        
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        DoneBtnOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        DoneBtnOutlet.layer.cornerRadius = 17.5
        DoneBtnOutlet.clipsToBounds = true
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoSearch" {
            let destinationController = segue.destination as! searchResultsVC
            destinationController.AreaIDToSearch = self.SelectedAreaId
            destinationController.CityIDToSearch = self.SelectedCityId
            destinationController.SpecialityIDToSearch = self.SelectedSpecaility[0].specialityID ?? 0
            destinationController.DocNameToSearch = ""
        }
    }
    
    @IBAction func DoneBtn(_ sender: Any) {
        performSegue(withIdentifier: "GoSearch" , sender: nil)
    }
    
}


extension ChoseCityViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !CityAlreadyChosed {
            print(CityArray.count)
            return CityArray.count
        } else {
            return AreaArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if !CityAlreadyChosed {
            print("incitycreate")
            let Citycell =  tableView.dequeueReusableCell(withIdentifier: "CityAreaCell") as! CityAreaTableViewCell
            Citycell.ConfigurationCell(name: CityArray[indexPath.row].name ?? "")
            return Citycell
        } else {
            let AreaCell =  tableView.dequeueReusableCell(withIdentifier: "CityAreaCell") as! CityAreaTableViewCell
            AreaCell.ConfigurationCell(name: AreaArray[indexPath.row].name ?? "")
            return AreaCell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if CityAlreadyChosed == true {
            //   self.TxtFieldGov.isHidden = false
            SelectedAreaId = AreaArray[indexPath.row].cityID ?? 0
            //self.TxtFieldGov.isHidden = false
            TxtFieldGov.text = AreaArray[indexPath.row].name ?? ""
            TxtFieldGov.endEditing(true)
            
        } else {
            SelectedCityId =  CityArray[indexPath.row].cityID ?? 0
            CityAlreadyChosed = true
            self.TxtFieldCityName.text = CityArray[indexPath.row].name ?? ""
            cityPresenter.getCitiesForGov(SelectedCityId)
            TxtFieldCityName.endEditing(true)
            // TxtFieldGov.isHidden = true
            
        }
    }
    
    
}


extension ChoseCityViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField === TxtFieldGov{
            AreaArray.removeAll()
            cityPresenter.getCitiesForGov(SelectedCityId)
            tableview.reloadData()
        } else if textField === TxtFieldCityName {
            print("incitydidselect")
            CityArray.removeAll()
            AreaArray.removeAll()
            govPresenter.getAllGovs()
            CityAlreadyChosed = false
        }
        
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
}


extension ChoseCityViewController : GovernorateDelegate {
    
    func getAllGovsDidSuccess() {
        CityArray = govPresenter.govs
        tableview.reloadData()
    }
    
    func getAllGovsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func viewGovsDidSuccess() {}
    func viewGovsDidFail(_ message: String) {}
}


extension ChoseCityViewController : CityDelegate {
    
    func getAllCitiesDidSuccess() {}
    
    func getAllCitiesDidFail(_ message: String) {}
    
    func getCitiesForGovDidSuccess() {
        AreaArray = cityPresenter.cities
        tableview.reloadData()
    }
    
    func getCitiesForGovDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}

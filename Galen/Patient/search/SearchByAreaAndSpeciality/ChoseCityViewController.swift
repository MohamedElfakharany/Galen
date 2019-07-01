//
//  ChoseCityViewController.swift
//  Galen
//
//  Created by elfakharany on 6/25/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ChoseCityViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
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
            SelectedAreaId =  AreaArray[indexPath.row].id ?? 0
          //self.TxtFieldGov.isHidden = false
            TxtFieldGov.text = AreaArray[indexPath.row].name ?? ""
            TxtFieldGov.endEditing(true)
          
        } else {
            SelectedCityId =  CityArray[indexPath.row].id ?? 0
            CityAlreadyChosed = true
            self.TxtFieldCityName.text = CityArray[indexPath.row].name ?? ""
            FetchArea(ChosenGovernateID: SelectedCityId)
            TxtFieldCityName.endEditing(true)
           // TxtFieldGov.isHidden = true
            
        }
    }
    

    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var TxtFieldCityName: UITextField!
    @IBOutlet weak var TxtFieldGov: UITextField!
    @IBOutlet weak var DoneBtnOutlet: UIButton!
    
    var SelectedSpecaility = [Speciality]()
    var CityArray = [Gov]()
    var AreaArray = [Area]()
    
    var CityAlreadyChosed : Bool = false
    
    var TestAreaArray = [[String:AnyObject]]()
    var TestGovArray  = [[String:AnyObject]]()
    
    var SelectedCityId = 0
    var SelectedAreaId  = 0
  
    override func viewDidLoad() {
        super.viewDidLoad()
        print(SelectedSpecaility)
       let  selectedSpecialityID = SelectedSpecaility[0].specialityID
        
        imageText()
        gradBTNS()
        
        CityAlreadyChosed = false
        self.TxtFieldGov.delegate = self
        
        tableview.delegate = self
        tableview.dataSource = self
        FetchCity()
        tableview.reloadData()
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        
    }
    
    ////
    func FetchCity() {
        
        Alamofire.request(URLs.allGovs, method: .post, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
            //    print(responseData)
                let swiftyJsonVar = JSON(responseData.result.value!)
                //   print("swiftyforcities\(swiftyJsonVar)")
                if let resData = swiftyJsonVar["list"].arrayObject {
                    print(resData)
                    self.TestGovArray =  resData as! [[String:AnyObject]]
                    for NextCity in self.TestGovArray {
                        let ReceivedCity = Gov.init(
                            _name: NextCity["name"] as! String
                            , _id: NextCity["id"] as! Int )
                        self.CityArray.append(ReceivedCity)
                        self.tableview.reloadData()
                    }
                    self.tableview.reloadData()
                    print(self.CityArray)
                    //self.TxtFieldGov.isHidden = false
                }
            }
        }
    }
    
    /////FetchAreas(Cities)
    func FetchArea(ChosenGovernateID: Int) {
        print(ChosenGovernateID)
//        let header : [String: String] = [
//            "Authorization" : helper.getAPIToken().token ?? "",
//            "Content-Type" : "application/json"
//        ]
        
        let parameters: Parameters = [
            "where":
                [
                    "gov.id"  : ChosenGovernateID
            ]
        ]
        Alamofire.request(URLs.allCities, method: HTTPMethod.post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (responseData) -> Void in
            print(responseData)
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                print(swiftyJsonVar)
                if let resData = swiftyJsonVar["list"].arrayObject {
                    self.TestAreaArray =  resData as! [[String:AnyObject]]
                    for NextArea in self.TestAreaArray {
                        let ReceivedArea = Area.init(
                            _name: NextArea["name"] as! String
                            , _id: NextArea["id"] as! Int )
                        self.AreaArray.append(ReceivedArea)
                        self.tableview.reloadData()
                    }
                    self.tableview.reloadData()
                }
                print(self.AreaArray)
            }
        }
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
extension ChoseCityViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField === TxtFieldGov{
            AreaArray.removeAll()
            FetchArea(ChosenGovernateID: SelectedCityId)
            tableview.reloadData()
        } else if textField === TxtFieldCityName {
            print("incitydidselect")
            CityArray.removeAll()
            AreaArray.removeAll()
            FetchCity()
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

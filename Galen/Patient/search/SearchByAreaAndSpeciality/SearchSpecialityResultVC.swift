//
//  SearchSpecialityResultVC.swift
//  Galen
//
//  Created by elfakharany on 6/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit


class SearchSpecialityResultVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var SpecialitySearch: UISearchBar!
    
    var DocSpecialties:[String] = []
    var SpecailityArray:[Speciality] = []
    var SelectedSpetiality = [Speciality]()
    var searching = false
    var specialityPresenter: SpecialityPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      //  tableView.delaysContentTouches = false
      //  tableView.allowsMultipleSelection = true
        
        specialityPresenter = SpecialityPresenter(delegate: self)
        specialityPresenter.getAllSpecialities()
        
       self.tableView.delegate = self
       self.tableView.dataSource = self
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToCitySelect" {
                let destinationController = segue.destination as! ChoseCityViewController
            destinationController.SelectedSpecaility.insert(self.SelectedSpetiality[0], at: 0)
        }
    }

    
    func DawnloadImage(url : String) -> UIImage   {
        
        let url = URL(string: "intmicrotec.neat-url.com:6566\(url)")
        let data = NSData(contentsOf: url!) 
        return UIImage(data: data! as Data) ?? #imageLiteral(resourceName: "calendar-times")
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



extension SearchSpecialityResultVC : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return SelectedSpetiality.count
        } else {
            return SpecailityArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as? TheEventTableViewCell
        let Mycell = tableView.dequeueReusableCell(withIdentifier: "Speccell", for: indexPath) as? specialityTableViewCell
        Mycell?.initiateCell(image: #imageLiteral(resourceName: "calendar-times") , label: SpecailityArray[indexPath.row].name ?? "")
        print(indexPath.row)
        return Mycell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        SpecialitySearch.text = SpecailityArray[indexPath.row].name
        SelectedSpetiality.insert(SpecailityArray[indexPath.row], at: 0)
        self.performSegue(withIdentifier: "GoToCitySelect", sender: nil)
        
    }
    
    
    
}



extension SearchSpecialityResultVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      //  SelectedSpetiality = SpecailityArray.filter{$0.name?.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil }
        SelectedSpetiality.removeAll()
        for Spec in SpecailityArray {
            if Spec.name?.contains(searchText) ?? false{
                SelectedSpetiality.append(Spec)
                print(SelectedSpetiality)
                self.tableView.reloadData()
            }
                    searching = true
            self.tableView.reloadData()
        }

        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
    
}


extension SearchSpecialityResultVC : SpecialityDelegate {
    
    func getAllSpecialitiesDidSuccess() {
        SpecailityArray = specialityPresenter.specialities
    }
    
    func getAllSpecialitiesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
}

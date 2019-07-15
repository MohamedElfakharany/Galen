//
//  SearchSpecialityResultVC2.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchInsuranceResultVC2: UIViewController ,UITableViewDelegate , UITableViewDataSource{
    
    
    var InsuranceArray:[InsurnaceCompanies] = []
    var SelectedInsurance:[InsurnaceCompanies] = []
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var InsuranceSearch: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    @IBAction func BtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return SelectedInsurance.count
        }else {
            return InsuranceArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "GovesCell", for: indexPath) as? InsuranceCompanyTableViewCell
        
        MyCell?.inittiateCell(image: #imageLiteral(resourceName: "calendar-times") , label: InsuranceArray[indexPath.row].name! )
        return MyCell!
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

extension SearchInsuranceResultVC2: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //  SelectedSpetiality = SpecailityArray.filter{$0.name?.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil }
        SelectedInsurance.removeAll()
        for insurance in InsuranceArray {
            if insurance.name?.contains(searchText) ?? false{
                SelectedInsurance.append(insurance)
                print(SelectedInsurance)
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

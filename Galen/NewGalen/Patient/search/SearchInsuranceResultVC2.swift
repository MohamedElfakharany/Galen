//
//  SearchSpecialityResultVC2.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchInsuranceResultVC2: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var InsuranceSearch: UISearchBar!
    
    var InsuranceArray:[InsuranceCompany] = []
    var SelectedInsurance:[InsuranceCompany] = []
    var searching = false
    var presenter: InsurancePresenter!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        presenter = InsurancePresenter(delegate: self)
        presenter.getAllCompanies()
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



extension SearchInsuranceResultVC2 : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return SelectedInsurance.count
        }else {
            return InsuranceArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "InsuranceCompanyTableViewCell", for: indexPath) as? InsuranceCompanyTableViewCell
        MyCell?.setupCell(company: InsuranceArray[indexPath.row])
        return MyCell!
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
}



extension SearchInsuranceResultVC2: InsuranceDelegate {
    
    func getAllCompaniesDidSuccess() {
        InsuranceArray = presenter.companies
        tableView.reloadData()
    }
    
    func getAllCompaniesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}

//
//  AuthInsuranceCompaniesVC2.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class AuthInsuranceCompaniesVC2: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var InsuranceSearch: UISearchBar!
    
    var InsuranceArray:[InsuranceCompany] = []
    var SelectedInsurance:[InsuranceCompany] = []
    var searching = false
    var presenter: InsurancePresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.delegate = self
        tableView.dataSource = self
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


extension AuthInsuranceCompaniesVC2: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return SelectedInsurance.count
        }else {
            return InsuranceArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "AuthInsuranceCell", for: indexPath) as? AuthInsuranceCompaniesVC2TableViewCell
        
        MyCell?.inittiateCell(image: #imageLiteral(resourceName: "calendar-times") , label: InsuranceArray[indexPath.row].name! )
        return MyCell!
    }
    
}




extension AuthInsuranceCompaniesVC2: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
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


extension AuthInsuranceCompaniesVC2: InsuranceDelegate {
    
    func getAllCompaniesDidSuccess() {
        InsuranceArray = presenter.companies
        tableView.reloadData()
    }
    
    func getAllCompaniesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }

}

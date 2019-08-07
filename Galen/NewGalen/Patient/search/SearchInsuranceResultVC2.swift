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
  
    var searching = false
    var presenter: InsurancePresenter!
    weak var delegate: SearchDoctorDelegate?
    
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



extension SearchInsuranceResultVC2 : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? presenter.searchedCompanies.count : presenter.companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "InsuranceCompanyTableViewCell", for: indexPath) as? InsuranceCompanyTableViewCell
        let company = searching ? presenter.searchedCompanies[indexPath.row] : presenter.companies[indexPath.row]
        MyCell?.setupCell(company: company)
        return MyCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let company = searching ? presenter.searchedCompanies[indexPath.row] : presenter.companies[indexPath.row]
        delegate?.didChoseInsurance(company: company, viewController: self)
    }
    
}



extension SearchInsuranceResultVC2: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        presenter.searchCompanies(text: searchBar.text ?? "")
        searching = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}



extension SearchInsuranceResultVC2: InsuranceDelegate {
   
    func getAllCompaniesDidSuccess() {
        tableView.reloadData()
    }
    
    func getAllCompaniesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func searchCompaniesDidSuccess() {
        tableView.reloadData()
    }
    
    func searchCompaniesDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
}

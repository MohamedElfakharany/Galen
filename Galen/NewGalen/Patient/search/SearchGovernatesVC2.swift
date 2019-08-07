//
//  SearchGovernatesVC2.swift
//  Galen
//
//  Created by elfakharany on 7/15/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchGovernatesVC2: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var GovesSearch: UISearchBar!
    
    var searching = false
    var presenter: GovernoratePresenter!
    weak var delegate: SearchDoctorDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        presenter = GovernoratePresenter(delegate: self)
        presenter.getAllGovs()
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


extension SearchGovernatesVC2 : UITableViewDelegate,UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? presenter.searchedGovs.count : presenter.govs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "SelectGovsTableViewCell", for: indexPath) as? SelectGovsTableViewCell
        let gov = searching ? presenter.searchedGovs[indexPath.row] : presenter.govs[indexPath.row]
        MyCell?.setupCell(gov: gov)
        return MyCell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let gov = searching ? presenter.searchedGovs[indexPath.row] : presenter.govs[indexPath.row]
        delegate?.didChoseGovernorate(gov: gov, viewController: self)
    }
}


extension SearchGovernatesVC2: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        presenter.searchGovs(text: searchBar.text ?? "")
        searching = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}



extension SearchGovernatesVC2 : GovernorateDelegate {
    
    func getAllGovsDidSuccess() {
        tableView.reloadData()
    }
    
    func getAllGovsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func viewGovsDidSuccess() {}
    func viewGovsDidFail(_ message: String) {}
    
    func searchGovsDidSuccess() {
        tableView.reloadData()
    }
    
    func searchGovsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    
}

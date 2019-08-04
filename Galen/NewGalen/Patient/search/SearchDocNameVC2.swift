//
//  SearchDocNameVC2.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchDocNameVC2: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DocNameSearch: UISearchBar!
    
    var searching = false
    var presenter: DoctorPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        presenter = DoctorPresenter(delegate: self)
        presenter.getAllDoctors()
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


extension SearchDocNameVC2 : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searching ? presenter.searchedDoctors.count : presenter.doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "SearchDocNameTableViewCell", for: indexPath) as? SearchDocNameTableViewCell
        let doctor = searching ? presenter.searchedDoctors[indexPath.row] : presenter.doctors[indexPath.row]
        MyCell!.setupCell(doctor: doctor)
        return MyCell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



extension SearchDocNameVC2: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        presenter.searchDoctors(text: searchBar.text ?? "")
        searching = true
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}



extension SearchDocNameVC2 : DoctorDelegate {
    
    func getAllDoctorsDidSuccess() {
        tableView.reloadData()
    }
    
    func getAllDoctorsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    func getSearchDoctorsDidSuccess() {
        tableView.reloadData()
    }
    
    func getSearchDoctorsDidFail(_ message: String) {
        showAlert(title: "Error", message: message)
    }
    
    
}

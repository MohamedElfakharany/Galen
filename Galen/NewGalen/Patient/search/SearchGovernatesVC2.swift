//
//  SearchGovernatesVC2.swift
//  Galen
//
//  Created by elfakharany on 7/15/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchGovernatesVC2: UIViewController , UITableViewDelegate,UITableViewDataSource{

    
    var GovesArray:[InsurnaceCompanies] = []
    var SelectedGoves:[InsurnaceCompanies] = []
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var GovesSearch: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return SelectedGoves.count
        }else {
            return GovesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "InsuranceCell", for: indexPath) as? InsuranceCompanyTableViewCell
        
        MyCell?.inittiateCell(image: #imageLiteral(resourceName: "calendar-times") , label: GovesArray[indexPath.row].name! )
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

extension SearchGovernatesVC2: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //  SelectedSpetiality = SpecailityArray.filter{$0.name?.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil }
        SelectedGoves.removeAll()
        for Goves in GovesArray {
            if Goves.name?.contains(searchText) ?? false{
                SelectedGoves.append(Goves)
                print(SelectedGoves)
                self.tableView.reloadData()
            }
            searching = true
            self.tableView.reloadData()
        }
        
        tableView.reloadData()
    }
}

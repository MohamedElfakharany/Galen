//
//  SearchDocNameVC2.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchDocNameVC2: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    
    var DocsArray:[String] = []
    var SelectedDocs:[String] = []
    var searching = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var DocNameSearch: UISearchBar!
    
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
            return SelectedDocs.count
        }else {
            return DocsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "DocNameCell", for: indexPath) as? InsuranceCompanyTableViewCell
        
    //    MyCell?.inittiateCell(image: #imageLiteral(resourceName: "calendar-times") , label: DocsArray[indexPath.row].name! )
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

extension SearchDocNameVC2: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        //  SelectedSpetiality = SpecailityArray.filter{$0.name?.range(of: searchText, options: [.anchored, .caseInsensitive]) != nil }
        SelectedDocs.removeAll()
        for insurance in DocsArray {
//            if insurance.name?.contains(searchText) ?? false{
//                SelectedDocs.append(insurance)
//                print(SelectedDocs)
//                self.tableView.reloadData()
//            }
            searching = true
            self.tableView.reloadData()
        }
        
        tableView.reloadData()
    }
}

//
//  SearchDocsResultsVC2.swift
//  Galen
//
//  Created by elfakharany on 7/17/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class SearchDocsResultsVC2: UIViewController {
    
    @IBOutlet weak var LblLocation: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var doctors = [Doctor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
}



extension SearchDocsResultsVC2 : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchDocsResultsTableViewCell", for: indexPath) as! SearchDocsResultsTableViewCell
        cell.setupCell(doctors[indexPath.row])
        cell.makeReservation = { [weak self] in
            let doc = self?.doctors[indexPath.row]
            let vc = self?.storyboard?.instantiateViewController(withIdentifier: "DocDataVC2") as! DocDataVC2
            vc.passedDoctor = doc
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190
    }
    
}

//
//  DoctorRatingVC2.swift
//  Galen
//
//  Created by elfakharany on 7/23/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DoctorRatingVC2: UIViewController, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var LblRating: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "DoctorRating", for: indexPath) as? DocRatingTableViewCell
        
        return MyCell!
    }
    
    @IBAction func BtnDismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

//
//  HDashboard.swift
//  Galen
//
//  Created by elfakharany on 8/3/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HDashboard: UIViewController ,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var BackView: UIView!
    @IBOutlet weak var TxtFieldPickDate: UITextField!
    @IBOutlet weak var BtnSearch: UIButton!
    @IBOutlet weak var tableView: UITableView!
//    Table View Cell ID = "HosDocAppointmentVC2"
    private var DatePicker : UIDatePicker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BackView.layer.cornerRadius = 5
        BackView.clipsToBounds = true
        BackView.layer.shadowRadius = 3
        
        DatePicker = UIDatePicker()
        
        DatePicker?.datePickerMode = .date
        
        DatePicker?.addTarget(self, action: #selector(HDashboard.DateChanged(DatePicker:)), for: .valueChanged)
        
        TxtFieldPickDate.inputView = DatePicker
        TxtFieldPickDate.delegate = self
        
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func DateChanged(DatePicker: UIDatePicker){
        let dateForamatter = DateFormatter()
        dateForamatter.dateFormat = "MM/dd/yyyy"
        TxtFieldPickDate.text = dateForamatter.string(from: DatePicker.date)
        //        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let MyCell = tableView.dequeueReusableCell(withIdentifier: "HosDocAppointmentVC2", for: indexPath) as? HDashboardTableViewCell
        return MyCell!
    }
    
    @IBAction func BtnNotification(_ sender: Any) {
    }
    
    @IBAction func BtnBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}

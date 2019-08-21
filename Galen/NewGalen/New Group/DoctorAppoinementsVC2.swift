//
//  DoctorAppoinementsVC2.swift
//  Galen
//
//  Created by elfakharany on 7/29/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
    
class DoctorAppoinementsVC2: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout ,UITextFieldDelegate{
    
        private var DatePicker : UIDatePicker?
        
        @IBOutlet weak var BackView:UIView!
        @IBOutlet weak var CollectionView: UICollectionView!
        @IBOutlet weak var TxtFieldPickDate: UITextField!
        @IBOutlet weak var BtnView: UIButton!
        
     
        override func viewDidLoad() {
            super.viewDidLoad()
            
            BackView.layer.cornerRadius = 5
            BackView.clipsToBounds = true
            BackView.layer.shadowRadius = 3
            
            DatePicker = UIDatePicker()
            
            DatePicker?.datePickerMode = .date
            
            DatePicker?.addTarget(self, action: #selector(DoctorAppoinementsVC2.DateChanged(DatePicker:)), for: .valueChanged)
            
            TxtFieldPickDate.inputView = DatePicker
            TxtFieldPickDate.delegate = self
            
            CollectionView.delegate = self
            CollectionView.dataSource = self
          
            CollectionView.backgroundColor = .clear
            CollectionView.alwaysBounceVertical = true
            
            CollectionView.register(UINib.init(nibName: "AppoinemnetCollectionViewCellVC2", bundle: nil), forCellWithReuseIdentifier: "AppoinmemntCellVC2")
            
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppoinmemntCellVC2", for: indexPath) as? AppointmentCollectionViewCellVC2
            else { return UICollectionViewCell () }
        return cell
    }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
            UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
            let screenWidth = UIScreen.main.bounds.width
            if screenWidth < 350 {
                var width = ( screenWidth - 30 ) / 2
                width = width > 200 ? 200 : width
                return CGSize.init(width: width , height: 120 )
            }else{
                var width = ( screenWidth - 40 ) / 3
                width = width > 200 ? 200 : width
                return CGSize.init(width: width , height: width )
            }
        }
    
    @IBAction func BtnNotification(_ sender :Any) {
        
    }
    
}

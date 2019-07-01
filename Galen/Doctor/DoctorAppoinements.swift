//
//  DoctorAppoinements.swift
//  Galen
//
//  Created by elfakharany on 5/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DoctorAppoinements: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    private var datePicker : UIDatePicker?
    
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TxtFieldPickDate: UITextField!
    @IBOutlet weak var BtnView: UIButton!
    
    lazy var Refresher : UIRefreshControl  = {
        let Refresher = UIRefreshControl()
        Refresher.addTarget(self, action: #selector(GetTickets), for: .valueChanged)
        
        return Refresher
    }()
    
    var TicketsArray = [Ticket]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(DoctorAppoinements.dateChanged(datePicker:)), for: .valueChanged)
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DoctorAppoinements.viewTapped(gestureRecognizer:)))
//        view.addGestureRecognizer(tapGesture)
        TxtFieldPickDate.inputView = datePicker
        
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.init(cgColor: #colorLiteral(red: 0.3357163072, green: 0.6924583316, blue: 1, alpha: 1)).cgColor,
            UIColor.init(cgColor: #colorLiteral(red: 0.3381540775, green: 0.899985373, blue: 0.6533825397, alpha: 1)).cgColor
            ])
        TxtFieldPickDate.layer.borderColor = #colorLiteral(red: 0.3341197073, green: 0.8013575673, blue: 0.7325223088, alpha: 1)
        TxtFieldPickDate.layer.borderWidth=0.3
        
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        CollectionView.addSubview(Refresher)
        
        CollectionView.backgroundColor = .clear
        CollectionView.alwaysBounceVertical = true
        
        CollectionView.register(UINib.init(nibName: "searchDoctorResults", bundle: nil), forCellWithReuseIdentifier: "AppoinmemntCell")
        gradBTNS()
        GetTickets()
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateForamatter = DateFormatter()
        dateForamatter.dateFormat = "MM/dd/yyyy"
        TxtFieldPickDate.text = dateForamatter.string(from: datePicker.date)
//        view.endEditing(true)
    }
    
    
     func gradBTNS() {
        
        let RightGradientColor = #colorLiteral(red: 0.337254902, green: 0.6941176471, blue: 1, alpha: 1)
        let LiftGradientColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
        
        // Register BTN
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.frame = BtnView.bounds
        gradientLayer.colors = [RightGradientColor.cgColor, LiftGradientColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        BtnView.layer.insertSublayer(gradientLayer, at: 0)
        BtnView.clipsToBounds = true
        
    }
    
    @objc private func GetTickets(){
        self.Refresher.endRefreshing()
    
//        let parameters: Parameters = [
//            "where":
//                [
//                    "date" : "08/06/2019" ,
//                    "selected_doctor.id" : 50
//                ]
//        ]
        
        Alamofire.request(URLs.allTickets, method: .post, encoding: JSONEncoding.default, headers: nil) .responseData { response in
            
            print(response.request)
            switch response.result
            {
            case .success(let value):
                let json = JSON(value).dictionary
                do {
                    let datas = try json!["list"]?.rawData()
                    print(datas)
                    do {
                        let ticketData = try? newJSONDecoder().decode([Ticket].self, from: datas!)
                        self.TicketsArray = ticketData!
                        print("FirstTicket\(self.TicketsArray.count )")
                        self.CollectionView.reloadData()
                    }
                } catch  {
                }
                
               
            case .failure(_):
                print("Failure")
            }
        }
    }



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TicketsArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppoinmemntCell", for: indexPath) as? AppoinemnetCollectionViewCell
            else { return UICollectionViewCell () }
    
        for NextTicket in self.TicketsArray{
            var StatuesColor : UIColor
            if (NextTicket.status?.nameEn == "available") {
                StatuesColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
            }else{
                StatuesColor = #colorLiteral(red: 0.4595606327, green: 0.772092998, blue: 0.9913946986, alpha: 1)
            }
            cell.EditCell(
                Day: NextTicket.selectedTime?.day?.name ?? "" ,
                Date: NextTicket.date ?? "" ,
                Time: "From \(NextTicket.selectedTime?.from?.hour ?? 00) To \(NextTicket.selectedTime?.to?.hour ?? 00)",
                Statues: NextTicket.status?.nameEn ?? "",
                StatuesColor: StatuesColor)
        return cell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("indidselect")
        self.performSegue(withIdentifier: "hamouda", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "hamouda" {
            let indexPath  = self.CollectionView?.indexPathsForSelectedItems?.first
            let SelectedTicket = TicketsArray[(indexPath?.row)!] //error
            let controller = segue.destination as! PopUpViewController
            controller.TicketArr.insert(SelectedTicket, at: 0)
        }
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
}

//
//  HospitalDoctorTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 5/28/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HospitalDoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var LblDoctorSpeciality: UILabel!
    @IBOutlet weak var LblDoctorName: UILabel!
    
    var DoctorTickets = [Ticket]()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
        
        print("inCollection")
        
       // NotificationCenter.default.addObserver(self, selector: #selector(loadList(notification:)), name: NSNotification.Name(rawValue: "load"), object: nil)
      // NotificationCenter.default.addObserver(self, selector: "loadList:", name:NSNotification.Name(rawValue: "load"), object: nil)

   //     NotificationCenter.default.addObserver(self, selector: #selector(helloReceived), name: NSNotification.Name("hello"), object: nil)
        
     
        
        self.contentView.layer.cornerRadius = 10.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2.0)//CGSizeMake(0, 2.0);
        self.layer.shadowRadius = 3.5
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
        
        
    }
//    @objc func loadList(notification: NSNotification) {
//        print("ListnerAccessed")
//        self.CollectionView.reloadData()
//    }
    
    @objc func onNotification(notification:Notification)
    {
        print("INNOticficataiosd")
        self.CollectionView.reloadData()
    }
    
    @IBAction func showAlertDialog(_ sender: UIButton) {
        // Declare Alert
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to Logout?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ViewNextVC = UIAlertAction(title: "VIEW", style: .default, handler: { (action) -> Void in
            print("Ok button click...")
            self.logoutFun()
            
            
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button click...")
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ViewNextVC)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        //    self.present(dialogMessage, animated: true, completion: nil)
        
        
    }
    
    func logoutFun()
    {
        print("Logout Successfully...!")
    }
    
    
    func EditCell (DoctorName : String , DoctorSepciality : String , cDoctorTickets : [Ticket]){
        self.LblDoctorName.text = DoctorName
        self.LblDoctorSpeciality.text = DoctorSepciality
        self.DoctorTickets = cDoctorTickets
        self.CollectionView.reloadData()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension HospitalDoctorTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DoctorTickets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AppoinmemntCell", for: indexPath) as? AppoinemnetCollectionViewCell
            else { return UICollectionViewCell () }
        
        print("CellForRowAt COllectio")
        
        for NextTicket in self.DoctorTickets{
            var StatuesColor : UIColor
            if (NextTicket.status?.nameEn == "available") {
                StatuesColor = #colorLiteral(red: 0.337254902, green: 0.8980392157, blue: 0.6549019608, alpha: 1)
            }else{
                StatuesColor = #colorLiteral(red: 0.4595606327, green: 0.772092998, blue: 0.9913946986, alpha: 1)
            }
            
            print("FromColloection\(self.DoctorTickets)")
            
            cell.EditCell(
                Day: NextTicket.selectedTime?.day?.name ?? "" ,
                Date: NextTicket.date ?? "" ,
                Time: "\(String(describing: NextTicket.selectedTime?.from)) to \(String(describing: NextTicket.selectedTime?.to)) ",
                Statues: NextTicket.status?.nameEn ?? "",
                StatuesColor: StatuesColor)
            self.CollectionView.reloadData()
            return cell
        }
        return cell
    }}


extension HospitalDoctorTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let screenWidth = UIScreen.main.bounds.width
        if screenWidth < 400 {
            let width = ( screenWidth - 30 ) / 2
            //     width = width > 200 ? 200 : width
            return CGSize.init(width: width , height: 100 )
        }else{
            let width = ( screenWidth - 40 ) / 3
            //       width = width > 200 ? 200 : width
            return CGSize.init(width: width , height: 100 )
        }
    }
}

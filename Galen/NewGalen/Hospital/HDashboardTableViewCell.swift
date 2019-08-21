//
//  HDashboardTableViewCell.swift
//  Galen
//
//  Created by elfakharany on 8/3/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class HDashboardTableViewCell: UITableViewCell {

    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    // collection view cell ID = "AppoinmemntCellVC2"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

}

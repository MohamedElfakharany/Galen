//
//  DocDataVC2.swift
//  Galen
//
//  Created by elfakharany on 7/22/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class DocDataVC2: UIViewController {
    
    @IBOutlet weak var DocImage: UIImageView!
    @IBOutlet weak var LblDocName: UILabel!
    @IBOutlet weak var LblDocSpeciality: UILabel!
    @IBOutlet weak var StarLeft1: UIImageView!
    @IBOutlet weak var StarLeft2: UIImageView!
    @IBOutlet weak var StarLeft3: UIImageView!
    @IBOutlet weak var StarLeft4: UIImageView!
    @IBOutlet weak var StarLeft5: UIImageView!
    @IBOutlet weak var LblDocAddress: UILabel!
    @IBOutlet weak var LblDocPrice: UILabel!
    @IBOutlet weak var CollectionView: UICollectionView!
    @IBOutlet weak var TxtViewReview: UITextView!
    
    
    var passedDoctor: Doctor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        CollectionView.delegate = self
//        CollectionView.dataSource = self
    }
    

}




extension DocDataVC2 : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DocDataVC2CollectionViewCell", for: indexPath) as! DocDataVC2CollectionViewCell
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
}



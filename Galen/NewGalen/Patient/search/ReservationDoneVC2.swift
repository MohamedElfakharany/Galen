//
//  ReservationDoneVC2.swift
//  Galen
//
//  Created by elfakharany on 7/24/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class ReservationDoneVC2: UIViewController {

    @IBOutlet weak var LblDocName: UILabel!
    
    var passedDoctor: Doctor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LblDocName.text = "دكتور \(passedDoctor.name!)"
    }
    
    
}

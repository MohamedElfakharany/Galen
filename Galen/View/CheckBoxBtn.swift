//
//  CheckBoxBtn.swift
//  Galen
//
//  Created by elfakharany on 7/14/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class Checkbox: UIButton {
    
    let checkedImage = UIImage(named: "checked")
    let uncheckedImage = UIImage(named: "uncheked")
    var action: ((Bool) -> Void)? = nil
    
    private(set) var isChecked: Bool = false {
        didSet{
            self.setImage(
                self.isChecked ? self.checkedImage : self.uncheckedImage,
                for: .normal
            )
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(
            self,
            action:#selector(buttonClicked(sender:)),
            for: .touchUpInside
        )
        self.isChecked = false
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            self.action?(!self.isChecked)
        }
    }
    
    func update(checked: Bool) {
        self.isChecked = checked
    }
}

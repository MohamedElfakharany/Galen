//
//  launchAnimation.swift
//  Galen
//
//  Created by elfakharany on 7/2/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class launchAnimation: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        

        imageView.fadeOut(completion: {
            (finished: Bool) -> Void in
            self.imageView.removeFromSuperview()
        })
        
        imageView.fadeIn(completion: {
            (finished: Bool) -> Void in
            print("finshed")
        })
    }

}

extension UIView {
    
    func fadeIn(_ duration: TimeInterval = 1, delay: TimeInterval = 1.0, completion: @escaping ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0
        }, completion: completion)  }
    
    func fadeOut(_ duration: TimeInterval = 1, delay: TimeInterval = 2.0, completion: @escaping (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animate(withDuration: duration, delay: delay, options: UIView.AnimationOptions.curveEaseIn, animations: {
            self.alpha = 0.3
        }, completion: completion)
    }
}

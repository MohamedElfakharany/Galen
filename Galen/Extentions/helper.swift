//
//  helper.swift
//  Galen
//
//  Created by elfakharany on 3/12/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import UIKit

class helper: NSObject {
    class func restartApp(){
        guard let window = UIApplication.shared.keyWindow else {return}
        let sb = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        if getAPIToken() == nil {
            vc = sb.instantiateInitialViewController()!
        }else {
            vc = sb.instantiateViewController(withIdentifier: "PSFD")
        }
        window.rootViewController = vc
        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    
    class func dleteAPIToken() {
        let def = UserDefaults.standard
        def.removeObject(forKey: "user_token")
        def.synchronize()
        
        restartApp()
    }
    
    class func saveAPIToken(token: String) {
        let def = UserDefaults.standard
        def.setValue(token, forKey: "user_token")
        def.synchronize()
        
        restartApp()
    }
    
    class func saveUserId(userId: String) {
        let def = UserDefaults.standard
        def.setValue(userId, forKey: "user_id")
        def.synchronize()
        print("UserIDSaved")
        restartApp()
    }
    
    class func getAPIToken() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_token") as? String
    }
    
    class func getUserId() -> String? {
        let def = UserDefaults.standard
        return def.object(forKey: "user_id") as? String
    }

}

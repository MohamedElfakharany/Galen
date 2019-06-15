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
        if getAPIToken().role == nil {
            vc = sb.instantiateInitialViewController()!
        }else if getAPIToken().role == "patients_admin" {
            vc = sb.instantiateViewController(withIdentifier: "HomeTabBar")
        }else {
            vc = sb.instantiateViewController(withIdentifier: "Hoar")
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
    
    class func saveAPIUser(User: Client) {
        let def = UserDefaults.standard
        def.setValue(User, forKey: "user")
        def.synchronize()
        restartApp()
    }
    
    class func getAPIToken() -> (token: String?,role: String?) {
        let def = UserDefaults.standard
        return (def.object(forKey: "user_token") as? String, def.object(forKey: "role") as? String)
    }
    
//    class func saveUserId(userId: String) {
//        let def = UserDefaults.standard
//        def.setValue(userId, forKey: "user_id")
//        def.synchronize()
//        print("UserIDSaved")
//        restartApp()
//    }
//
    
    
//    class func getUserId() -> String? {
//        let def = UserDefaults.standard
//        return def.object(forKey: "user_id") as? String
//    }

}

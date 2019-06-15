//
//  ExJsonToString.swift
//  Galen
//
//  Created by elfakharany on 5/18/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

func toJSonString(data : Any) -> String {
    
    var jsonString = "";
    
    do {
        
        let jsonData = try JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
        jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)! as String
        
    } catch {
        print(error.localizedDescription)
    }
    
    return jsonString;
}

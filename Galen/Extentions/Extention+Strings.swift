//
//  Extention+Strings.swift
//  Galen
//
//  Created by elfakharany on 5/7/19.
//  Copyright © 2019 Mohamed Elfakharany. All rights reserved.
//

import Foundation

extension String {
    var trimmed: String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
}

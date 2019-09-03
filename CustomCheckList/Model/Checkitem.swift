//
//  Checkitem.swift
//  CustomCheckList
//
//  Created by Abdullah Gebreil on 11/26/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
class Checkitem : NSObject {
    var text: String = ""
    var cheched: Bool = false
    
    
    
    
    
    
    
    func toggleChecked()  {
        cheched = !cheched
    }
}

//
//  ToDoList.swift
//  CustomCheckList
//
//  Created by Abdullah Gebreil on 11/26/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import Foundation
class TODoList  {
    var listOFItem :[Checkitem] = [Checkitem]()
    
    
    
    
    
    
    
    
    init() {
        
        let raw0item = Checkitem()
        let raw1item = Checkitem()
        let raw2item = Checkitem()
        let raw3item = Checkitem()
        let raw4item = Checkitem()
        raw0item.text = "CheckList"
        raw1item.text = "Watch TV"
        raw2item.text = "Paly Football"
        raw3item.text = "TOdolist"
        raw4item.text = "Zamalek"
        
        
        listOFItem.append(raw0item)
        listOFItem.append(raw1item)
        listOFItem.append(raw2item)
        listOFItem.append(raw3item)
        listOFItem.append(raw4item)
        
      
     
    
//    
//    func addItem(item :Checkitem) ->Checkitem {
//        item.cheched = FlattenSequence
//        listOFItem.append(item)
//        return item
//    }
//    
//    func getRandomTitles() -> String {
//        let titles = ["New ToDo","ToDo list","fill me out ","i need somthing to do","Much ToDo"]
//        let title = Int.random(in: 0...titles.count - 1)
//        return titles[title]
//    }
    }
        func move(item :Checkitem,index : Int ){
            guard let currentIndex = listOFItem.index(of: item) else {return}
            
            listOFItem.remove(at: currentIndex )
            listOFItem.insert(item , at: index)
            
        }

}

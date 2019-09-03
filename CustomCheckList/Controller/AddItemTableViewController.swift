//
//  AddItemTableViewController.swift
//  CustomCheckList
//
//  Created by Abdullah Gebreil on 11/27/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit
protocol addItemviewcontrollerDelegrte : class {
    func additemviewcontrollerDidCancel(controller:AddItemTableViewController)
    func additemviewcontroller(controller:AddItemTableViewController , item :Checkitem)
    
    
    
    
    
    func addItemviewcontrollerForEditing(controller:AddItemTableViewController , item :Checkitem)
}
class AddItemTableViewController: UITableViewController {
    //Outlets
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var addBarButtton: UIBarButtonItem!
    @IBOutlet weak var textFeild: UITextField!
    
    
    
    //Varaibles
    weak var delegete: addItemviewcontrollerDelegrte?
    weak var editItem: Checkitem?
    weak var todolist:TODoList?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item  = editItem {
            title = "Edit Item"
            textFeild.text = item.text
            addBarButtton.isEnabled = true
        }
        
        
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textFeild.becomeFirstResponder()
    }
    @IBAction func add(_ sender: Any) {
      
        if let item = editItem ,let text = textFeild.text{
            item.text = text
            delegete?.addItemviewcontrollerForEditing(controller: self, item: item)
              navigationController?.popViewController(animated: true)
        } else {
          
            let item = Checkitem()
            if let textfeild = textFeild.text {
                item.text = textfeild
            }
            item.cheched = false
            delegete?.additemviewcontroller(controller: self, item: item )
              navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegete?.additemviewcontrollerDidCancel(controller: self)
    }
    
    
    
}










extension AddItemTableViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFeild.resignFirstResponder()
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textFeild.text ,
            let range = Range(range, in: currentText) else {return false}
        
        let newText = currentText.replacingCharacters(in: range, with: string)
        if newText.isEmpty {
            
            addBarButtton.isEnabled = false
        } else {
            addBarButtton.isEnabled = true
        }
        return true
    }
    
}

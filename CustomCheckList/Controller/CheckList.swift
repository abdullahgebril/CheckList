//
//  ViewController.swift
//  CustomCheckList
//
//  Created by Abdullah Gebreil on 11/26/1440 AH.
//  Copyright © 1440 AH Abdullah Gebreil. All rights reserved.
//

import UIKit

class CheckList: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    //Outlets
    @IBOutlet weak var tableview: UITableView!
    
    
    
    
    
    
    
    
    //Varaibles
    var list: TODoList = TODoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.delegate = self
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: true)
        tableview.setEditing(editing, animated: true)
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        list.move(item: list.listOFItem[sourceIndexPath.row], index: destinationIndexPath.row)
        tableview.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.listOFItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"CheckItem" , for: indexPath)
        let item = list.listOFItem[indexPath.row]
        configureText(cell: cell, item: item)
        configureCheckMark(cell: cell, item: item)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = list.listOFItem[indexPath.row]
             item.toggleChecked()
            configureCheckMark(cell: cell, item: item)
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
        list.listOFItem.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    
    func configureText(cell: UITableViewCell , item :Checkitem ) {
        if let checkCell     = cell as? ChekListTableViewCell {
            checkCell.checkitemText.text = item.text
        }
    }
    func configureCheckMark(cell: UITableViewCell , item :Checkitem ) {
        if let checkCell = cell as? ChekListTableViewCell {
        
        if item.cheched {
            checkCell.checkItemMark.text = "✔️"
        } else {
            checkCell.checkItemMark.text = " "
        }
       
    }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemSegue" {
            if let additemtableview = segue.destination as? AddItemTableViewController {
                additemtableview.delegete = self
                additemtableview.todolist = list
            }
        }
        else if  segue.identifier == "editItemSegue" {
            if let edititem = segue.destination as? AddItemTableViewController {
                if let cell = sender as? UITableViewCell ,let indexpath = tableview.indexPath(for: cell){
                    edititem.editItem = list.listOFItem[indexpath.row]
                    edititem.delegete = self
                    
                }
            }
        }
        
    }
}

extension CheckList: addItemviewcontrollerDelegrte {
    func addItemviewcontrollerForEditing(controller: AddItemTableViewController, item: Checkitem) {
        if let index = list.listOFItem.index(of:item) {
            let indexpath = IndexPath(row: index, section:0)
            if let cell = tableview.cellForRow(at: indexpath) {
                configureText(cell: cell, item: item)
            }
        }
        
    }
    
    func additemviewcontrollerDidCancel(controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func additemviewcontroller(controller: AddItemTableViewController, item: Checkitem) {
        
        let newindex = list.listOFItem.count
        list.listOFItem.append(item)
        let indexpath = IndexPath(row: newindex, section: 0)
        tableview.insertRows(at: [indexpath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}


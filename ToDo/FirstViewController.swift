//
//  FirstViewController.swift
//  ToDo
//
//  Created by Deipayan Dash on 02/06/18.
//  Copyright © 2018 Deipayan Dash. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate, UITableViewDataSource  {
    
    @IBOutlet var table: UITableView!
    var items:[String] = []

    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        
        return items.count
    }
    

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = (items[indexPath.row] )
        
        return cell
        
        
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete{
            items.remove(at: indexPath.row)
            table.reloadData()
            UserDefaults.standard.set(items, forKey: "Items")
        }
    }


    
    override func viewDidLoad() {
        table.reloadData()
        super.viewDidLoad()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        
        let ObjectItems = UserDefaults.standard.object(forKey: "Items")
        
        if let tempitems = ObjectItems as? [String]{
            
            items = tempitems
        }
        table.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


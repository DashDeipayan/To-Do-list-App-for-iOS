//
//  SecondViewController.swift
//  ToDo
//
//  Created by Deipayan Dash on 02/06/18.
//  Copyright © 2018 Deipayan Dash. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var addTexr: UITextField!
    

    @IBAction func add(_ sender: Any) {
        
        
        var items:[String]
        
        let ObjectItems = UserDefaults.standard.object(forKey: "Items")
        
        if let tempitems = ObjectItems as? [String]{
            
            items = tempitems
            items.append(addTexr.text!)
        }else {
            items = [addTexr.text!]
        }
        
        UserDefaults.standard.set(items, forKey: "Items")
        addTexr.text = ""
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      
        self.view.endEditing(true)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


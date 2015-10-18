//
//  ViewController3.swift
//  Hockey Central
//
//  Created by Patrick Chomczyk on 10/17/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class ViewController3: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    @IBAction func cancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
        }
    }
    
    
   @IBAction func submitButton(sender: AnyObject) {
        if let name = textField.text {
            Player(name: name)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

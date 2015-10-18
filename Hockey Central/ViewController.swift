//
//  ViewController.swift
//  Hockey Central
//
//  Created by Patrick Chomczyk on 10/16/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var standingsButton: UIButton!
    
    
    @IBAction func standings(sender: AnyObject) {
    }
    

    @IBAction func scoreboard(sender: AnyObject) {
    }

    
    @IBAction func stats(sender: AnyObject) {
    }
    
    
    override func viewDidAppear(animated: Bool) {
        //sets orrientation to portrait only
        let value = UIInterfaceOrientation.Portrait.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
    }
    
    override func shouldAutorotate() -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "hockeyBackground")?.drawInRect(self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


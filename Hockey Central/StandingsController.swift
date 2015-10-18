//
//  StandingsController.swift
//  Hockey Central
//
//  Created by Jimmy Carlson on 10/18/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class StandingsController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var teams:[Team] = NSUserDefaults.standardUserDefaults().teams
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var teams:[Team] = NSUserDefaults.standardUserDefaults().teams
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath:indexPath)
        
        cell.textLabel?.text = "\(indexPath.row + 1). \(teams[indexPath.row].getName())"
        
        return cell
        
    }
    
}
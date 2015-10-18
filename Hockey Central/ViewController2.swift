//
//  ViewController2.swift
//  Hockey Central
//
//  Created by Patrick Chomczyk on 10/17/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class ViewController2: UITableViewController {

 var players = [Player]()

override func viewDidLoad() {
    super.viewDidLoad()
    
    
    self.players = [Player]()
    
    self.players = self.players.sort { $0.name < $1.name }
    

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.players.count
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setToolbarHidden(false, animated: true)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
                
        var player : Player
        
        player = players[indexPath.row]
        
        cell.textLabel?.text = player.name
        
        return cell
    }
    
    @IBAction func doneButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
}
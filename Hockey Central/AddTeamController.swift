//
//  AddTeamController.swift
//  Hockey Central
//
//  Created by Jimmy Carlson on 10/18/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class AddTeamController: UIViewController {
    
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var winsLabel: UITextField!
    @IBOutlet weak var losses: UITextField!
    @IBOutlet weak var otLosses: UITextField!
    @IBOutlet weak var teamAddedStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamAddedStatusLabel.text = ""
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) { //stops editing when tapped outside
        self.view.endEditing(true)
    }
    
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    @IBAction func addTeam(sender: AnyObject) {
        var count = 0
        var name: String = ""
        var win: Int = 0
        var loss: Int = 0
        var otLoss: Int = 0
        
        if var names = teamName.text {
            name = names
            count++
        }else {
            teamAddedStatusLabel.text = teamAddedStatusLabel.text! + " Please add a team name"
        }
        if var wins = Int(winsLabel.text!) {
            win = wins
            count++
        }else {
            teamAddedStatusLabel.text = teamAddedStatusLabel.text! + " Please enter wins"
        }
        if var lose = Int(losses.text!) {
            loss = lose
            count++
        }else {
            teamAddedStatusLabel.text = teamAddedStatusLabel.text! + " Please enter losses"
        }
        if let otLosses = Int(otLosses.text!) {
            otLoss = otLosses
            count++
        }else {
            teamAddedStatusLabel.text = teamAddedStatusLabel.text! + " Please enter overtime losses"
        }
        
        if count == 4 {
            teamAddedStatusLabel.text = "Team added succesfully"
            let newTeam = Team(teamName: name, wins: win, losses: loss, otLosses: otLoss)
            
            var teams:[Team] = NSUserDefaults.standardUserDefaults().teams
            
            teams.append(newTeam)
            
            NSUserDefaults.standardUserDefaults().teams = teams
            
            dismissViewControllerAnimated(true) { () -> Void in
                
            }
        }
    }
    
    @IBAction func done(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
}
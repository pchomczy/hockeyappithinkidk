//
//  ScoreboardSettings.swift
//  Hockey Central
//
//  Created by Jimmy Carlson on 10/17/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class ScoreboardSettingsController: UIViewController {
    
    @IBOutlet weak var homeTeamTextField: UITextField!
    @IBOutlet weak var awayTeamTextField: UITextField!
    
    
    var homeTeamLabel: String?
    
    @IBAction func setHomeTeam(sender: AnyObject) {
        if let teamName = homeTeamTextField.text {
            NSUserDefaults.standardUserDefaults().setObject(teamName, forKey: "homeTeamName")
        }
    }
    
    @IBAction func setAwayTeam(sender: AnyObject) {
        if let teamName = awayTeamTextField.text {
            NSUserDefaults.standardUserDefaults().setObject(teamName, forKey: "awayTeamName")
        }
    }

    @IBAction func returnButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
            
        }
    }
    
    override func viewDidLoad() {
        
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.LandscapeLeft,UIInterfaceOrientationMask.LandscapeRight]
    }
}
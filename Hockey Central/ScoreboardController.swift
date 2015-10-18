//
//  ScoreboardController.swift
//  Hockey Central
//
//  Created by Jimmy Carlson on 10/17/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation
import UIKit

class ScoreboardController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var homeScore: UILabel!
    @IBOutlet weak var awayScore: UILabel!
    @IBOutlet weak var homeTeamNameLabel: UILabel!
    @IBOutlet weak var awayTeamNameLabel: UILabel!
    @IBOutlet weak var periodNumber: UILabel!
    @IBOutlet weak var winner: UILabel!
    @IBOutlet weak var pauseButton: UIBarButtonItem!
    @IBOutlet weak var restartButton: UIBarButtonItem!
    @IBOutlet weak var playButton: UIBarButtonItem!
    
    var homeTeam = "Home"
    var awayteam = "Away"
    var timer = NSTimer()
    var startMinutes = 20
    let startSeconds = 0
    var timeMinutes = 20
    var timeSeconds = 0
    var period = 1
    
    @IBAction func startTime(sender: AnyObject) {
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
        playButton.enabled = false // must fix for everything else
    }
    
    override func viewDidLoad() {
        
        
        NSUserDefaults.standardUserDefaults().setObject(homeTeam, forKey: "homeTeamName")
        
        NSUserDefaults.standardUserDefaults().setObject(awayteam, forKey: "awayTeamName")
        
    }
    
    func updateTimer() {
        if timeSeconds == 1 && timeMinutes == 0 {
            timer.invalidate()
            nextPeriod()
        }
        if timeSeconds > 0 {  //decrementing the time and adjusting when seconds == 0
            timeSeconds = timeSeconds - 1
        } else{
            timeSeconds = 59
            timeMinutes = timeMinutes - 1
        }
        if timeSeconds >= 10 { //formatting label
            timeLabel.text = ("\(timeMinutes):\(timeSeconds)")
        } else {
        timeLabel.text = ("\(timeMinutes):0\(timeSeconds)")
        }

    }
    
    func checkWinner() -> Bool {
        let home = Int(homeScore.text!)
        let away = Int(awayScore.text!)
        
        if home > away {
            self.winner.text = ("\(homeTeamNameLabel.text!) wins!")
            return true
        }else if away > home {
            self.winner.text = ("\(awayTeamNameLabel.text!) wins!")
            return true
        }else {
            return false
        }
    }
    
    func nextPeriod() { //updates period label when timer strikes 0
        if period == 3 && checkWinner(){
            checkWinner()
        }else {
        period++
        periodNumber.text = String(period)
        
        
        timeSeconds = startSeconds + 1
        timeMinutes = startMinutes
        if startSeconds < 10{
            timeLabel.text = "\(timeMinutes):0\(timeSeconds)"
        }else {
            timeLabel.text = "\(timeMinutes):0\(timeSeconds)"
        }
        }
    }
    
    @IBAction func pauseTime(sender: AnyObject) {
        timer.invalidate()
        playButton.enabled = true
    }
    
    @IBAction func restartTime(sender: AnyObject) { //restarts the whole board
        timer.invalidate()
        playButton.enabled = true
        timeMinutes = startMinutes
        timeSeconds = startSeconds
        timeLabel.text = ("\(timeMinutes):0\(timeSeconds)")
        winner.text = ""
        period = 1
        periodNumber.text = "1"
        homeScore.text = "0"
        awayScore.text = "0"
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        homeTeamNameLabel.text = NSUserDefaults.standardUserDefaults().objectForKey("homeTeamName") as? String
        awayTeamNameLabel.text = NSUserDefaults.standardUserDefaults().objectForKey("awayTeamName") as? String
        
        
        periodNumber.text = String(period)
        
        if startSeconds > 9{
        timeLabel.text = "\(startMinutes):\(startSeconds)"
        }else {
            timeLabel.text = "\(startMinutes):0\(startSeconds)"
        }
        if animated {
            UIGraphicsBeginImageContext(self.view.frame.size) //sets the background
            UIImage(named: "Scoreboard Background")?.drawInRect(self.view.bounds)
            
            let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            self.view.backgroundColor = UIColor(patternImage: image)
        }
    }
    
    @IBAction func addAwayTeamScore(sender: AnyObject) {
        var score = Int(awayScore.text!)
        score! += 1
        awayScore.text = "\(score!)"
        if period > 3 {//checks score in overtime
            timer.invalidate()
            checkWinner()
        }
    }
    
    @IBAction func subtractAwayTeamScore(sender: AnyObject) {
        if Int(awayScore.text!) <= 0 {
            awayScore.text = awayScore.text
        }else {
            var score = Int(awayScore.text!)
            score! -= 1
            awayScore.text = "\(score!)"
        }
    }
    @IBAction func addHomeTeamScore(sender: AnyObject) {
        var score = Int(homeScore.text!)
        score! += 1
        homeScore.text = "\(score!)"
        if period > 3 {//checks score in overtime
            timer.invalidate()
            checkWinner()
        }
    }
    @IBAction func subtractHomeTeamScore(sender: AnyObject) {
        if Int(homeScore.text!) <= 0 {
            homeScore.text = homeScore.text
        }else {
            var score = Int(homeScore.text!)
            score! -= 1
            homeScore.text = "\(score!)"
        }

    }
    
    @IBAction func backButton(sender: AnyObject) {
        dismissViewControllerAnimated(true) { () -> Void in
        
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ScoreboardSettingsSegue") {
            let des = segue.destinationViewController as! ScoreboardSettingsController
            des.homeTeamLabel = homeTeamNameLabel.text
        }
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return [UIInterfaceOrientationMask.LandscapeLeft,UIInterfaceOrientationMask.LandscapeRight]
    }
    
}

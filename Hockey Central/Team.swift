//
//  Team.swift
//  Hockey Central
//
//  Created by Jimmy Carlson on 10/18/15.
//  Copyright © 2015 Patrick Chomczyk. All rights reserved.
//

import Foundation

class Team: NSObject, NSCoding {
    var teamName: String
    var losses: Int
    var wins: Int
    var otLosses: Int
    var points:Int
    init(teamName: String, wins: Int, losses: Int, otLosses: Int ) {
        self.teamName = teamName
        self.wins = wins
        self.losses = losses
        self.otLosses = otLosses
        self.points = wins * 2 + otLosses
    }
    
    required init?(coder aDecoder: NSCoder) {
        teamName = aDecoder.decodeObjectForKey("teamName") as! String
        wins = aDecoder.decodeObjectForKey("wins") as! Int
        losses = aDecoder.decodeObjectForKey("losses") as! Int
        otLosses = aDecoder.decodeObjectForKey("otLosses") as! Int
        points = aDecoder.decodeObjectForKey("points") as! Int
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(teamName, forKey: "teamName")
        aCoder.encodeObject(losses, forKey: "losses")
        aCoder.encodeObject(wins, forKey: "wins")
        aCoder.encodeObject(otLosses, forKey: "otLosses")
        aCoder.encodeObject(points, forKey: "points")
    }
    
    func getWins() -> Int {
        return self.wins
    }
    
    func getName() -> String {
        return self.teamName
    }
    
    func getLosses() -> Int {
        return self.losses
    }
    
    func getOtLosses() -> Int {
        return self.otLosses
    }
    
    
    
}

extension NSUserDefaults {
    var teams: [Team] {
        get {
            let data = self.objectForKey("teams") as? NSData
            if data == nil {
                return []
            }
            return NSKeyedUnarchiver.unarchiveObjectWithData(data!) as! [Team]
            
        } set {
            
            let data = NSKeyedArchiver.archivedDataWithRootObject(newValue as NSArray)
            self.setObject(data, forKey: "teams")
            
        }
    }
}
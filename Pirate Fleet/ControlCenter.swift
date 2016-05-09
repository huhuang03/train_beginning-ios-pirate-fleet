//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    var location: GridLocation
    var explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(human: Human) {
        let smallShip = Ship(length: 2, location: GridLocation(x: 0, y: 1), isVertical: false)
        let mediumShip1 = Ship(length: 3, location: GridLocation(x: 4, y: 2), isVertical: false)
        let mediumShip2 = Ship(length: 3, location: GridLocation(x: 2, y: 3), isVertical: false)
        let largeShip = Ship(length: 4, location: GridLocation(x: 0, y: 4), isVertical: false)
        let extraLargeShip = Ship(length: 5, location: GridLocation(x: 0, y: 5), isVertical: false)
        
        let mine1 = Mine(location: GridLocation(x: 6, y: 3), explosionText: "mine1")
        let mine2 = Mine(location: GridLocation(x: 7, y: 4), explosionText: "mine2")
        
        
        human.addShipToGrid(smallShip)
        human.addShipToGrid(mediumShip1)
        human.addShipToGrid(mediumShip2)
        human.addShipToGrid(largeShip)
        human.addShipToGrid(extraLargeShip)
        human.addMineToGrid(mine1)
        human.addMineToGrid(mine2)
    }
    
    func calculateFinalScore(gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = gameStats.enemyShipsRemaining * gameStats.sinkBonus + gameStats.humanShipsSunk * gameStats.shipBonus - (gameStats.numberOfHitsOnEnemy + gameStats.numberOfMissesByHuman) * gameStats.guessPenalty;
        print("the finel score:\(finalScore)")
        return finalScore
    }
}
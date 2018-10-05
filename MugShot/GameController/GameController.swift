//
//  GameController.swift
//  MugShot
//
//  Created by Kamil Wrobel on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class GameController {
    
    
    static let shared = GameController()
    private init() {}
    
    var player = Player.init(highScore: 0, currentScore: 0, deaths: 0, face: UIImage(named: "karl")!)
    
    func saveGame(){
        
    }
    
    
    
    
    
    
    
    
   var enemies : [Enemy]  {
        let kamil = Enemy.init(image: #imageLiteral(resourceName: "kamil"), tapAmout: 1, speed: 1, name: "Kamil")
        let jason = Enemy.init(image: #imageLiteral(resourceName: "jason"), tapAmout: 1, speed: 1, name: "Jason")
        let jayden = Enemy.init(image: #imageLiteral(resourceName: "jayden"), tapAmout: 2, speed: 1, name: "Jayden")
        let nick = Enemy.init(image: #imageLiteral(resourceName: "nick"), tapAmout: 3, speed: 1, name: "Nick")
        let john = Enemy.init(image: #imageLiteral(resourceName: "john"), tapAmout: 1, speed: 1, name: "John")
        let abdi = Enemy.init(image: #imageLiteral(resourceName: "abdi"), tapAmout: 1, speed: 1, name: "Abdi")
        let markus = Enemy.init(image: #imageLiteral(resourceName: "markus"), tapAmout: 1, speed: 1, name: "Markus")
        let eric = Enemy.init(image: #imageLiteral(resourceName: "eric"), tapAmout: 1, speed: 1, name: "Eric")
        let cody = Enemy.init(image: #imageLiteral(resourceName: "cody"), tapAmout: 1, speed: 1, name: "Cody")
        let quinten = Enemy.init(image: #imageLiteral(resourceName: "quinten"), tapAmout: 1, speed: 1, name: "Quinten")
        let trevor = Enemy.init(image: #imageLiteral(resourceName: "brick"), tapAmout: 3, speed: 1, name: "Trevor")
        
        return [kamil, jason, jayden, nick, john, abdi, markus, eric, cody, quinten, trevor]
        
    }
    

}

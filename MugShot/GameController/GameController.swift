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
    
    
    
    
    
}

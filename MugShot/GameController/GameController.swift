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
    
    let currentScore = 0
    var player = Player.init(highScore: 0, currentScore: 0, deaths: 0, face: UIImage(named: "karl")!)
    
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
        let trevor = Enemy.init(image: UIImage(named: "trevor")!, tapAmout: 3, speed: 1, name: "Trevor")
        
        return [kamil, jason, jayden, nick, john, abdi, markus, eric, cody, quinten, trevor]
        
    }
    
    func saveGame() {
        
    }
    
    func randomEnemy() -> Enemy {
        let index =  Int.random(in: 0..<enemies.count)
        return enemies[index]
    }
    

    func randomX(inRange range: Int) -> Int {
        //let widthAnchor = vc.gameArea.bounds.width - 50
        let x = Int.random(in: 0...range)
        return x
    }
    func randomX2(inRange range: Int) -> Int {
        //let widthAnchor = vc.gameArea.bounds.width - 50
        let x = Int.random(in: 0...range)
        return x
    }
    
    let enemyView = CharacterView()
    
    //MARK: - Spawn Enemy
    func spawnEnemy(onVC vc: PlayGameViewController) {
        let screenHeight = vc.view.bounds.maxY
        let gameAreaWidth = vc.view.bounds.width
        let enemy = randomEnemy()
        let xPosition = CGFloat(-300 + randomX(inRange: Int(gameAreaWidth)))
        let xPositionBottom = CGFloat(-300 + randomX2(inRange: Int(gameAreaWidth)))
        let startY = screenHeight * 1.2
        let startPoint = CGPoint(x: xPosition, y: startY)
        let endPoint = CGPoint(x: xPositionBottom, y: -screenHeight * 1.2)
        enemyView.bounds.origin = startPoint
        enemyView.characterImage = enemy.image
        enemyView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        enemyView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        vc.view.addSubview(enemyView)
        UIView.animate(withDuration: 2.5, delay: 0, options: [.curveEaseInOut], animations: {
            self.enemyView.bounds.origin = endPoint
        }) { (true) in
            self.enemyView.removeFromSuperview()
           
            self.spawnEnemy(onVC: vc)
        }
    }
    
    //MARK: - Intersection of enemy and player
    func intersection(enemy: CharacterView, player: CharacterView, completion: @escaping (Bool)->Void) {
        
       guard let enemyFrame = enemy.layer.presentation()?.frame,
        let playerFrame = player.layer.presentation()?.frame else {return}
        print(enemyFrame.intersects(playerFrame))
        if enemyFrame.intersects(playerFrame){
            completion(true)
        }
    }
    
    
    
    
    
}

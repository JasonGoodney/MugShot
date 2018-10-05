//
//  PlayGameViewController.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class PlayGameViewController: UIViewController {

    // MARK: - Properties
    private let characterSize: CGFloat = 100
    let randomPersonInt = Int.random(in: 0..<GameController.shared.enemies.count)
    
    
    // MARK: - Subviews
    let backgrounImage : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "brickLogo")
        imageView.image = image
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let blueAlfa : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        view.alpha = 0.6
        return view
    }()
    
    lazy var playerView: CharacterView = {
        let view = CharacterView()
        view.characterImage = GameController.shared.player.face
        return view
    }()
    
<<<<<<< HEAD
=======
    var gameArea = UIView()
>>>>>>> 103835cfcd5468967771218a5925de354d97cb9e
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSetup()
        setupGameArea()
        setupPlayerView()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        GameController.shared.spawnEnemy(onVC: self)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    
    func backgroundSetup() {
        self.view.addSubview(backgrounImage)
        backgrounImage.translatesAutoresizingMaskIntoConstraints = false
        backgrounImage.fillSuperview()
        
        self.view.addSubview(blueAlfa)
        blueAlfa.translatesAutoresizingMaskIntoConstraints = false
        blueAlfa.fillSuperview()
    }
    
    func setupPlayerView() {
        gameArea.addSubview(playerView)
        
        playerView.anchor(nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, topConstant: 0, leftConstant: 0, bottomConstant: 64, rightConstant: 0, widthConstant: characterSize, heightConstant: characterSize)
        playerView.anchorCenterXToSuperview()
        
    }
    
     func setupGameArea() {
        gameArea.backgroundColor = .orange
        view.addSubview(gameArea)
        
        gameArea.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 60, bottomConstant: 0, rightConstant: 60, widthConstant: 0, heightConstant: 0)
    }
>>>>>>> 103835cfcd5468967771218a5925de354d97cb9e
    
    // MARK: - Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.25) {
            let touchPoint = touches.first!.location(in: self.gameArea)
            if touchPoint.x > 20 && touchPoint.x < self.gameArea.frame.width - 20 {
                self.playerView.center.x = touchPoint.x
            }
        }
    }

}

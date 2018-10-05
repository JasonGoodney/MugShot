//
//  PlayGameViewController.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit
import AVFoundation

class PlayGameViewController: UIViewController {
    
    // MARK: - Properties
    private let characterSize: CGFloat = 100
    let randomPersonInt = Int.random(in: 0..<GameController.shared.enemies.count)
    var player: AVAudioPlayer?
    var endGameVc = EndGameViewController()
    
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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundSetup()
        setupPlayerView()
        playSound()
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { (_) in
            
            
            
            GameController.shared.intersection(enemy: GameController.shared.enemyView, player: self.playerView, completion: { (success) in
                if success {
                    DispatchQueue.main.async {
                        self.present(self.endGameVc, animated: true, completion: {
                        })
                    }
                }
            })
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        GameController.shared.spawnEnemy(onVC: self)
        
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
        self.view.addSubview(playerView)
        playerView.anchor(nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, topConstant: 0, leftConstant: 0, bottomConstant: 64, rightConstant: 0, widthConstant: characterSize, heightConstant: characterSize)
        playerView.anchorCenterXToSuperview()
        
    }
    
    
    // MARK: - Touches
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.25) {
            
            let touchPoint = touches.first!.location(in: self.view)
            if touchPoint.x > 20 && touchPoint.x < self.view.frame.width - 20 {
                self.playerView.center.x = touchPoint.x
            }
        }
    }
    
    //MARK: - Intersection
    
    
    
    
    //MARK: - Music
    func playSound(){
        guard let url = Bundle.main.url(forResource: "Jingle_Bell_Rock", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: .mixWithOthers)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

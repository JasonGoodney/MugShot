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
    private let characterSize: CGFloat = 64
    
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
        view.addSubview(playerView)
        
        playerView.anchor(nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, topConstant: 0, leftConstant: 0, bottomConstant: 64, rightConstant: 0, widthConstant: characterSize, heightConstant: characterSize)
        playerView.anchorCenterXToSuperview()
        
    }
}

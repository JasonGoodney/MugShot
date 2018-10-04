//
//  StartGameViewController.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class StartGameViewController: UIViewController {
    
    lazy var newGameButton: GameButton = {
        let button = GameButton()
        button.title = "New Game"
        return button
    }()
    
    let logoLabel: GameLabel = {
        let label = GameLabel()
        label.text = "Mug Shot"
        return label
    }()
    
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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    
    }
    
    // MARK: - UI
    private func updateView() {
        
        view.backgroundColor = .white
        
        view.addSubview(newGameButton)
        view.addSubview(logoLabel)
        
        setupConstraints()
        setupDelegates()
        backgroundSetup()
    }
    
    private func setupConstraints() {
        logoLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 80, leftConstant: 20, bottomConstant: 0, rightConstant: 20, widthConstant: 0, heightConstant: 80)
        
        newGameButton.anchor(nil, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 80, bottomConstant: 0, rightConstant: 80, widthConstant: 0, heightConstant: 64)
        newGameButton.anchorCenterSuperview()

    }
    
    func backgroundSetup() {
        self.view.addSubview(backgrounImage)
        backgrounImage.translatesAutoresizingMaskIntoConstraints = false
        backgrounImage.fillSuperview()
        
        self.view.addSubview(blueAlfa)
        blueAlfa.translatesAutoresizingMaskIntoConstraints = false
        blueAlfa.fillSuperview()
        
    }
    
    // MARK: - Delegates
    private func setupDelegates() {
        newGameButton.delegate = self
    }
}

// MARK: - GameButtonDelegate
extension StartGameViewController: GameButtonDelegate {
    func gameButtonWasTapped(_ gameButton: GameButton) {
        
    }
    
    
}

//
//  EndGameViewController.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {
    
    //MARK: - Regular Properties
    var playerName = "(player name)"
    //TODO: substitute 25 with player score
    var top5playersScore : Int = 25
    var curentPlayerScore : Int = 25
    
    //MARK: - Background Properties
    let backgrounImage : UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "brick")
        imageView.image = image
        return imageView
    }()

    let blueAlfa : UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        view.alpha = 0.6
        return view
    }()
    
    
    //MARK: - Labels
    let gameOverLabel : GameLabel = {
        let label = GameLabel()
        label.text = "GAME OVER"
        return label
    }()
    
    var curentScore : GameLabel = {
        let label = GameLabel()
        label.text = "Current Score: (25)"
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        return label
    }()
    
    var topFive : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.text = "Top Five:"
        return label
    }
    
    var topFive1 : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "1. \(self.playerName) : \(self.top5playersScore)"
        return label
    }
    
    var topFive2 : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "2. \(self.playerName) : \(self.top5playersScore)"
        return label
    }
    
    var topFive3 : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "3. \(self.playerName) : \(self.top5playersScore)"
        return label
    }
    
    var topFive4 : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "4. \(self.playerName) : \(self.top5playersScore)"
        return label
    }
    
    var topFive5 : GameLabel  {
        let label = GameLabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .black)
        label.text = "5. \(self.playerName) : \(self.top5playersScore)"
        return label
    }
    
    let restartButton : GameButton = {
        let button = GameButton()
        button.setTitle("Try Again", for: .normal)
        return button
    }()
    
    
    //MARK: - LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackgroundImage()
        setupLabels()
        
    }
    
    //MARK: - View Setup Methods
    func setUpBackgroundImage() {
        self.view.addSubview(backgrounImage)
        backgrounImage.translatesAutoresizingMaskIntoConstraints = false
        backgrounImage.fillSuperview()
        
        self.view.addSubview(blueAlfa)
        blueAlfa.translatesAutoresizingMaskIntoConstraints = false
        blueAlfa.fillSuperview()
    }
    
    
    //MARK: - Label Setup Methods
    func setupLabels(){
        self.view.addSubview(gameOverLabel)
        gameOverLabel.anchorCenterXToSuperview()
        gameOverLabel.anchorCenterYToSuperview(constant: -200)
        
        self.view.addSubview(curentScore)
        curentScore.anchorCenterXToSuperview()
        curentScore.anchor(gameOverLabel.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 50, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        let stackView = UIStackView(arrangedSubviews: [topFive,topFive1, topFive2, topFive3, topFive4, topFive5])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        self.view.addSubview(stackView)
        stackView.anchorCenterXToSuperview()
        stackView.anchorCenterYToSuperview(constant: 100)
        
        self.view.addSubview(restartButton)
        restartButton.anchorCenterXToSuperview()
        restartButton.anchorCenterYToSuperview(constant: 270)

    }
}

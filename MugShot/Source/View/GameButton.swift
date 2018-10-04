//
//  GameButton.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

protocol GameButtonDelegate: class {
    func gameButtonWasTapped(_ gameButton: GameButton)
}

class GameButton: UIButton {
    
    weak var delegate: GameButtonDelegate?
    
    var title: String? {
        didSet {
            setTitle(title, for: .normal)
        }
    }
    private let buttonColor: UIColor = .white

    convenience init() {
        self.init(frame: .zero)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addTarget(self, action: #selector(gameButtonTapped), for: .touchUpInside)
        
        updateView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    func updateView() {
        setTitleColor(buttonColor, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        layer.cornerRadius = 20
        layer.borderWidth = 3
        layer.borderColor = buttonColor.cgColor
        
    }
    
    // MARK: - Actions
    @objc func gameButtonTapped() {
        delegate?.gameButtonWasTapped(self)
    }
    
}

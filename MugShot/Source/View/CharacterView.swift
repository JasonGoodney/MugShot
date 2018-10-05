//
//  CharacterView.swift
//  MugShot
//
//  Created by Jason Goodney on 10/4/18.
//  Copyright © 2018 Jason Goodney. All rights reserved.
//

import UIKit

class CharacterView: UIView {

    var characterImage: UIImage? {
        didSet {
            setupImageViewImage()
        }
    }
    
    // MARK: - Subviews
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    // MARK: - Init
    convenience init() {
        self.init(frame: .zero)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupImageViewImage() {
        guard let image = characterImage else { return }
        imageView.image = image
    }
    
    private func updateView() {
        addSubview(imageView)
        translatesAutoresizingMaskIntoConstraints = false
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        imageView.fillSuperview()
    }

}

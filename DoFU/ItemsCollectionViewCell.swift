//
//  ItemsCollectionViewCell.swift
//  DoFU
//
//  Created by Home on 20.04.2023.
//

import UIKit
import Lottie

class ItemsCollectionViewCell: UICollectionViewCell {
    static let reuseID = "ItemsCollectionViewCell"

    var animationView: LottieAnimationView = {
        var view = LottieAnimationView()
        view = .init(name: "progress-bar")
        view.contentMode = .scaleAspectFit
        view.animationSpeed = 1
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.textColor = .green
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        // Задати задній фон для кожної cell
        contentView.addSubview(nameLabel)
        contentView.addSubview(mainImageView)
        contentView.addSubview(animationView)
        
        backgroundColor = .lightGray
        
     
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        mainImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 20).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2 / 5).isActive = true
        
        animationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        animationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        animationView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 20).isActive = true
        animationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2 / 6).isActive = true

    }
    
    override func layoutSubviews() {
        mainImageView.layer.cornerRadius = 50
        mainImageView.layer.shadowRadius = 9
        mainImageView.layer.shadowOpacity = 0.3
        mainImageView.layer.shadowOffset = CGSize(width: 5, height: 8)
        mainImageView.clipsToBounds = false
        
        //animationView.play()
        
    }
    
    public func play() {
        animationView.play(toProgress: 0.5)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

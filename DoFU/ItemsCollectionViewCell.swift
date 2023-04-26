//
//  ItemsCollectionViewCell.swift
//  DoFU
//
//  Created by Home on 20.04.2023.
//

import UIKit

class ItemsCollectionViewCell: UICollectionViewCell {
    static let reuseID = "ItemsCollectionViewCell"
    
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
    
    let progress: UIProgressView = {
        let status = UIProgressView()
        
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(mainImageView)
        contentView.addSubview(progress)
        backgroundColor = .lightGray
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        mainImageView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,constant: 20).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2 / 5).isActive = true
        
        progress.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.leftDistanceToView).isActive = true
        progress.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.rightDistanceToView).isActive = true
        progress.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 30).isActive = true
    }
    
    override func layoutSubviews() {
        mainImageView.layer.cornerRadius = 50
        mainImageView.layer.shadowRadius = 9
        mainImageView.layer.shadowOpacity = 0.3
        mainImageView.layer.shadowOffset = CGSize(width: 5, height: 8)
        mainImageView.clipsToBounds = false
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

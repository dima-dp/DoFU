//
//  ItemsCollectionView.swift
//  DoFU
//
//  Created by Home on 20.04.2023.
//

import UIKit

class ItemsCollectionView: UICollectionView {
    

    var items = [Item]()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        backgroundColor = .systemGray
        delegate = self
        dataSource = self
        
        register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.reuseID )
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.itemsMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
    }
    
    func setItems(cells: [Item]) {
        
        self.items = cells
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




extension ItemsCollectionView:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ItemsCollectionViewCell.reuseID, for: indexPath) as! ItemsCollectionViewCell
        cell.nameLabel.text = items[indexPath.row].name
        cell.mainImageView.image = items[indexPath.row].itemImage
        cell.progress.progress = 0.5
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.itemsItemWidth, height: frame.height * 0.9)
    }


    
    
}

//
//  ItemsCollectionView.swift
//  DoFU
//
//  Created by Home on 20.04.2023.
//

import UIKit
import Lottie

class ItemsCollectionView: UICollectionView {
    
    var items = [Item]()
    var currentCell = ItemsCollectionViewCell()
    var currentItem = Int()
    
    init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        self.isPagingEnabled = true
        
        backgroundColor = .systemGray
        
        delegate = self
        dataSource = self
        
        register(ItemsCollectionViewCell.self, forCellWithReuseIdentifier: ItemsCollectionViewCell.reuseID )
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = 0
        contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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
        
        //cell.progress.progress = 0.5
        currentCell = cell
        currentItem = indexPath.row
        
     return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: Constants.itemsItemWidth, height: frame.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        currentCell.play()
        print(items[currentItem].name)
    }
}

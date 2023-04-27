//
//  ItemsViewController.swift
//  DoFU
//
//  Created by Home on 05.03.2023.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet weak var ItemsScreenNavItem: UINavigationItem!
    
    private var itemsCollectionView = ItemsCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Adding CollectonView on ItemsVC
        view.addSubview(itemsCollectionView)
        
        // Creating constrains for CollectionView
        itemsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        itemsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        itemsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70).isActive = true
        itemsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        // Using test data for CollectionView
        itemsCollectionView.setItems(cells: Item.mockItems())
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       // print(TransferService.shared.sum)
      
   
    }
    
}

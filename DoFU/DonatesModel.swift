//
//  DonatesModel.swift
//  DoFU
//
//  Created by Home on 17.03.2023.
//

import RealmSwift

class Donate: Object {
    @objc dynamic var date = NSDate()
    @objc dynamic var sum = 0
}

struct Item {
    var name: String
    var itemImage: UIImage
    var cost: Int
    
    static func mockItems() -> [Item] {
        let firstItem = Item(name: "Abrams", itemImage: UIImage(named: "abrams")!, cost: 100_000)
        let secondItem = Item(name: "Leopard", itemImage: UIImage(named: "leopard2")!, cost: 200_000)
        let thirdItem = Item(name: "F-16", itemImage: UIImage(named: "f16")!, cost: 500_000)
        let fourthItem = Item(name: "Leopard", itemImage: UIImage(named: "leopard2")!, cost: 200_000)
   
        return [firstItem, secondItem, thirdItem, fourthItem]
    }
}

struct Constants {
    static let leftDistanceToView: CGFloat = 10
    static let rightDistanceToView: CGFloat = 10
    static let itemsMinimumLineSpacing: CGFloat = 0
    static let itemsItemWidth = (UIScreen.main.bounds.width) // - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.itemsMinimumLineSpacing / 2))
}

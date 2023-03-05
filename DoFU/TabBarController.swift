//
//  TabBarController.swift
//  DoFU
//
//  Created by Home on 05.03.2023.
//

import UIKit

class TabBarController: UITabBarController {
    @IBInspectable var initialIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedIndex = initialIndex
        
        
        
    }

}

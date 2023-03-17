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

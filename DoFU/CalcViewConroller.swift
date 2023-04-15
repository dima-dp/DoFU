//
//  CalcViewConroller.swift
//  DoFU
//
//  Created by Home on 05.03.2023.
//

import UIKit
import RealmSwift
import Foundation

class CalcViewConroller: UIViewController {
    
    let realm = try! Realm()
    var donatesArray: Results<Donate>!
    
    let buttonsCornerRadius = 5.0
    var stillTypying = false
    var sumValue = 0
    var date = Date()
    
    
    @IBOutlet weak var totalDonated: UILabel!
    @IBOutlet weak var donatedThisMonth: UILabel!
    @IBOutlet weak var donatedLastMonth: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var sumLabel: UILabel! {
        didSet {
            sumLabel.layer.cornerRadius = buttonsCornerRadius
        }
    }
    @IBOutlet var numberFromKeyboard: [UIButton]! {
        didSet {
            for button in numberFromKeyboard {
                button.layer.cornerRadius = buttonsCornerRadius
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLabelsWithDonatesStatistic()
        
        donatesArray = realm.objects(Donate.self)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        tableView.layer.cornerRadius = 5
        
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        let number = sender.currentTitle!
        if stillTypying {
            if sumLabel.text!.count < 10 {
                sumLabel.text = sumLabel.text! + number
            }
        } else if number != "0" {
            sumLabel.text = number
            stillTypying = true
        }
    }
    
    @IBAction func cPressed(_ sender: UIButton) {
        sumLabel.text = "0"
        stillTypying = false
    }
    
    @IBAction func savePressed(_ sender: UIButton) {
        
        sumValue = Int(sumLabel.text!)!
        guard sumValue != 0 else { return }
        date = Date()   // Add working with date
        
        let donate = Donate(value: [date, sumValue])
        try! realm.write {
            realm.add(donate)
        }
        
        // Do I need to add alert Saved?
        
        sumLabel.text = "0"
        stillTypying = false
        self.tableView.reloadData()
        updateLabelsWithDonatesStatistic()
        
        
    }
    
    // Mark: -> Private function to update Labels with info about donates
    private func updateLabelsWithDonatesStatistic() {
        
        updateTotalDonated()
        updateDonatedLastMonths()
        updateDonatedThisMonths()
    }
    
    private func updateTotalDonated() {
        let totalSumOfDonates: Int = realm.objects(Donate.self).sum(ofProperty: "sum")
        totalDonated.text = totalSumOfDonates.description
        
    }
    private func updateDonatedLastMonths() {
        
        let currentDate = Date()
        var date = Calendar.current.dateComponents([.month, .year], from: currentDate)
        date.day = 1
        date.hour = 00
        let endDate = Calendar.current.date(from: date) as Any
        
        date.month! -= 1
        let startDate = Calendar.current.date(from: date) as Any
        
        let sumDonatedThisMonths: Int = realm.objects(Donate.self).filter("self.date >= %@ && self.date < %@", startDate, endDate).sum(ofProperty: "sum")
        donatedLastMonth.text = sumDonatedThisMonths.description
        
    }
    private func updateDonatedThisMonths() {
        
        let currentDate = Date()
        var date = Calendar.current.dateComponents([.month, .year], from: currentDate)
        date.day = 1
        date.hour = 00
        let startDate = Calendar.current.date(from: date) as Any
        
        let sumDonatedThisMonths: Int = realm.objects(Donate.self).filter("self.date >= %@", startDate).sum(ofProperty: "sum")
        donatedThisMonth.text = sumDonatedThisMonths.description
        
    }
    
    
}




extension CalcViewConroller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return donatesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CalcTableViewCell
        
        // reversing array of donates to sort it by date (last in top):
        let donate = donatesArray.reversed()[indexPath.row]
        
        //formatting date to show it in short way:
        let dateForLabel = (donate.date as Date?)
        let formattedDate = dateForLabel?.formatted(
            .dateTime
                .month()
                .day()
                .year()
        )
        cell.dateLabel.text = formattedDate
        cell.sumLabel.text = donate.sum.description
        
        cell.backgroundColor = .systemGray2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if let header = Bundle.main.loadNibNamed("HeaderTableView", owner: self)?.first as? HeaderTableView {
            header.backgroundColor = .darkGray
            return header
        }
        else
        {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: -> Adding delete function (by swipe):
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // let donate = donatesArray.reversed()[indexPath.row]
            try! realm.write {
                realm.delete(realm.objects(Donate.self).filter("date=%@",donatesArray.reversed()[indexPath.row].date))
            }
            tableView.reloadData()
            updateLabelsWithDonatesStatistic()
        }
    }
    
}


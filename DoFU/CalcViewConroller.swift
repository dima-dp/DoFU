//
//  CalcViewConroller.swift
//  DoFU
//
//  Created by Home on 05.03.2023.
//

import UIKit
import Realm

class CalcViewConroller: UIViewController {
    
    let buttonsCornerRadius = 5.0
    var stillTypying = false
    var sumValue = ""
    var date = Date()


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
        
        sumValue = sumLabel.text!
        date = Date()   // Add working with date
        
        sumLabel.text = "0"
        stillTypying = false
    }
}




extension CalcViewConroller: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CalcTableViewCell
        cell.dateLabel.text = "01.11.2023"
        cell.sumLabel.text = "100 000"
        
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
    
}

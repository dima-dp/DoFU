//
//  CalcViewConroller.swift
//  DoFU
//
//  Created by Home on 05.03.2023.
//

import UIKit
import Realm

class CalcViewConroller: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .darkGray
        tableView.layer.cornerRadius = 5
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

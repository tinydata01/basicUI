//
//  VesselScheduleViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class VesselScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var sourceCodeLabel: UILabel!
    @IBOutlet var sourceLabel: UILabel!
    @IBOutlet var destinationCodeLabel: UILabel!
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    var date = "", destination = "", destinationCode = "", sourceCode = "", source = ""
    let titleLabel = ["Lisbon, 1896 - 9 days", "Lisbon, 1896 - 9 days"]
    let destinationDate = ["24 Apr 2018", "24 Apr 2018"]
    var destinationData = ""
    let sourceDate = ["15 Apr 2018", "15 Apr 2018"]
    var sourceData = ""
    let picture = [UIImage(named: "coastal.png"), UIImage(named: "coastal.png")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.configure(picture: picture[indexPath.row]!, title: titleLabel[indexPath.row], destination: destinationData, source: sourceData, sourceDate: sourceDate[indexPath.row], destinationDate: destinationDate[indexPath.row])
        
        return cell
    }

    
    func unwindViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func backNavigation(_ sender: Any) {
        unwindViewController()
    }
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
print(date , destination , destinationCode, sourceCode, source)
        sourceData = sourceCode + ", " + source
        destinationData = destinationCode + ", " + destination
        sourceCodeLabel.text = sourceCode
        sourceLabel.text = source
        destinationCodeLabel.text = destinationCode
        destinationLabel.text = destination
        dateLabel.text = date
        
        viewWillDisappear(true)
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
}

//
//  VesselScheduleViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class VesselScheduleViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var destinationCode: UILabel!
    @IBOutlet weak var sourceCode: UILabel!
    @IBOutlet weak var source: UILabel!
    
    var dateText: String = ""
    var destinationText: String = ""
    var destinationCodeText: String = ""
    var sourceCodeText: String = ""
    var sourceText: String = ""
    
    let titleLabel = ["Lisbon, 1896 - 9 days", "Lisbon, 1896 - 9 days"]
    let destinationDate = ["24 Apr 2018", "24 Apr 2018"]
    let destinationData = ["INCAEC, Vishakapatnam", "INCAEC, Vishakapatnam"]
    let sourceDate = ["15 Apr 2018", "15 Apr 2018"]
    let sourceData = ["AEJEC, Jabel Ali", "AEJEC, Jabel Ali"]
    let picture = [UIImage(named: "coastal.png"), UIImage(named: "coastal.png")]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.configure(picture: picture[indexPath.row]!, title: titleLabel[indexPath.row], destination: destinationData[indexPath.row], source: sourceData[indexPath.row], sourceDate: sourceDate[indexPath.row], destinationDate: destinationDate[indexPath.row])
        
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
        
        date.text = dateText
        sourceCode.text = sourceCodeText 
        destination.text = destinationText 
        destinationCode.text = destinationCodeText 
        source.text = sourceText
        
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

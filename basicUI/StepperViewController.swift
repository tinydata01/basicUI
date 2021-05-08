//
//  StepperViewController.swift
//  basicUI
//
//  Created by user189958 on 5/8/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    var imgArr = [UIImage(named: "coastal"),UIImage(named: "cargo"),UIImage(named: "bw"),UIImage(named: "cont"),UIImage(named: "glow")]
    var txt = ["asas","dwew","asas","asas","asas"]
    var txt2 = ["dwew","asas","dwew","dwew","dwew"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StepTableViewCell", for: indexPath)
        as! StepTableViewCell
        cell.img?.image = self.imgArr[indexPath.row]
        cell.line1.text = self.txt[indexPath.row]
        cell.line2.text = self.txt2[indexPath.row]
        return cell
    }
}

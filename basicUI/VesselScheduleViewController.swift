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
    
    var titleLabel = Array<String>()
    var destinationDate = Array<String>()
    var sourceDate = Array<String>()
    var date = "", destination = "", destinationCode = "", sourceCode = "", source = ""
    var destinationData = ""
    var sourceData = ""
    let picture = UIImage(named: "coastal.png")
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleLabel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardCell", for: indexPath) as! CardCell
        
        cell.configure(picture: picture!, title: titleLabel[indexPath.row], destination: destinationData, source: sourceData, sourceDate: sourceDate[indexPath.row], destinationDate: destinationDate[indexPath.row])
        
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
        DataService.shared.fetchVesselData{(result) in
                            switch result {
                            case .success(let gists):
                                for gist in gists {
                                    let vesselData =  gist.availableVessels
                                    for item in vesselData {
                                        self.titleLabel.append(item.vesselName+", "+item.vesselNo+" - "+item.expectedTimeValue+" "+item.expectedTimeUnit)
                                        self.destinationDate.append(item.arrivalDate)
                                        self.sourceDate.append(item.startDate)
                                    }
                                }
                            case .failure(let _error):
                                print(_error)
                            }
                }
        print(sourceDate)
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

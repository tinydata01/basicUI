//
//  StepperViewController.swift
//  basicUI
//
//  Created by user189958 on 5/8/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class StepperViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func backNavigation(_ sender: Any) {
        unwindViewController()
    }
    func unwindViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @IBOutlet weak var tableView: UITableView!
    var imgArr = ["bw","bw","bw", "bw","bw"]
    var txt = ["Booking Confirmed","Container Picked up","Arrived at POR","Arrived at POR","Shipment Received at POL"]
    var txt2 = ["Oman","Tras","Sewewd","Pijko","Hans"]
    var txt3 = ["8 Mar 2018","9 Mar 2018","10 Mar 2018","7 Mar 2018","30 Mar 2018"]
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(true)
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
        cell.img?.image = UIImage(named:self.imgArr[indexPath.row])
        cell.line1.text = self.txt[indexPath.row]
        cell.line2.text = self.txt2[indexPath.row]
        cell.line3.text = self.txt3[indexPath.row]
        // cell.roundImg = UIImage(named: "imageName")
        let anyAvatarImage:UIImage = UIImage(named: "fromdestination")!
        var flag = 0
        var ball = 1000
        if indexPath.row == 0 {
            flag = 1
            ball = 1
        }
        cell.roundImg.maskCircle(anyImage: anyAvatarImage,status: ball)
        let line_x = 35
        
        drawDottedLine(start: CGPoint(x: line_x, y: 3), end: CGPoint(x: line_x, y: 500), view: cell,status: flag)
        return cell
    }
    func drawDottedLine(start p0: CGPoint, end p1: CGPoint, view: UIView, status: Int) {
    let shapeLayer = CAShapeLayer()
    shapeLayer.strokeColor = UIColor.lightGray.cgColor
        if status == 1 {
            shapeLayer.strokeColor = UIColor.blue.cgColor
        }
    shapeLayer.lineWidth = 4
    shapeLayer.lineDashPattern = [20, 9] // 7 is the length of dash, 3 is length of the gap.

    let path = CGMutablePath()
    path.addLines(between: [p0, p1])
    shapeLayer.path = path
    //shapeLayer.zPosition = -1
    view.layer.addSublayer(shapeLayer)
}
    }
extension UIImageView {
    public func maskCircle(anyImage: UIImage,status :Int) {
    self.contentMode = UIView.ContentMode.scaleAspectFill
    self.layer.cornerRadius = self.frame.height / 2
    self.layer.masksToBounds = false
    self.clipsToBounds = true
        self.layer.zPosition = 10
   // make square(* must to make circle),
   // resize(reduce the kilobyte) and
   // fix rotation.
    self.backgroundColor = .lightGray
        if status == 1 {
            self.backgroundColor = .blue
        }
        else if status == 2{
            self.backgroundColor = .yellow
        }
  }
}


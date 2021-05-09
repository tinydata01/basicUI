//
//  VesselSearchViewController.swift
//  basicUI
//
//  Created by user189958 on 5/8/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit
import DropDown
class VesselSearchViewController: UIViewController,UITextFieldDelegate  {

    @IBAction func backNavigation(_ sender: Any) {
        unwindViewController()
    }
    
    func unwindViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var searchField: UITextField!
    @IBAction func trackButton(_ sender: Any) {
        print("ok")
    }
    
    let dropDown = DropDown()
    var jon : [VesselsData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.shared.fetchVesselData{(result) in
                    switch result {
                    case .success(let gists):
                        for gist in gists {
                            let vesselData =  gist.availableVessels
                            self.jon = vesselData
                            /*for item in vesselData {
                                self.titleLabel.append(item.vesselName+", "+item.vesselNo+" - "+item.expectedTimeValue+" "+item.expectedTimeUnit)
                                self.destinationDate.append(item.arrivalDate)
                                self.sourceDate.append(item.startDate)
                            }*/
                        }
                    case .failure(let _error):
                        print(_error)
                    }
        }
        // Do any additional setup after loading the view.
        searchField.delegate = self
        searchField.underlined(color: .darkGray)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.searchField.frame.height))
        searchField.leftView = paddingView
        searchField.leftViewMode = UITextField.ViewMode.always
        searchField.attributedPlaceholder = NSAttributedString(string: "Search by BL, BCG#, container#",attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        viewWillDisappear(true)
        dropDown.anchorView = hiddenView
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
  print("Selected item: \(item) at index: \(index)")
            self.searchField.text = item
}
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchField.resignFirstResponder()
            if(searchField.text?.count ?? 0 >= 2){
                let txt = searchField.text ?? ""
                let range = txt.index(txt.startIndex, offsetBy: 2)
                let srch = txt[..<range]
                print(srch)
                let filtered = jon.filter {
                    return $0.vesselName.range(of: srch, options: .caseInsensitive) != nil
}
                print(filtered)
                dropDown.dataSource = filtered.compactMap { $0.vesselName}
                dropDown.show()
            }
            /*let vc = self.storyboard?.instantiateViewController(identifier: "tempViewController") as! tempViewController
            self.navigationController?.pushViewController(vc, animated: true)*/
            
            return true
        }
    }


    extension UITextField {
        func underlined(color:UIColor){
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = color.cgColor
            border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
            border.borderWidth = width
            self.borderStyle = .none
            self.layer.addSublayer(border)
            self.layer.masksToBounds = true
        }
    }

    class ButtonWithImage: UIButton {
        
        override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = 8
            if imageView != nil {
                imageEdgeInsets = UIEdgeInsets(top: 10, left: (bounds.width - 75), bottom: 10, right: 25)
                titleEdgeInsets = UIEdgeInsets(top: 0, left: -65, bottom: 0, right: (imageView?.frame.width)!)
            }
        }
    }


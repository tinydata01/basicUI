//
//  DashboardViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

import DropDown
//import iOSDropDown
class DashboardViewController: UIViewController {
    //@IBOutlet var dateTxt: UITextField!
    let datePicker = UIDatePicker()
    @IBOutlet var dateTxt: UITextField!
    @IBOutlet weak var vesselScheduleLabel: UILabel!
    @IBOutlet weak var dropDownTextField1: UITextField!
    
    @IBOutlet var dropDownTextField2: UITextField!
    
    let dropDown = DropDown()
    let toDropDown = DropDown()
   
    @IBOutlet var toLocationLabel: UILabel!
    @IBOutlet var fromLocationLabel: UILabel!
    @IBAction func fromLocation(_ sender: Any) {
        self.dropDown.show()
    }
    
    @IBAction func toLocation(_ sender: Any) {
        self.toDropDown.show()
    }
    @IBOutlet weak var dropDownTextFeild2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        fromLocationLabel.text = "Select From Location"
        dropDown.anchorView = dropDownTextField1
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.direction = .any
        self.toLocationLabel.text = "Select to Location"
              toDropDown.anchorView = dropDownTextField2
              toDropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
              toDropDown.topOffset = CGPoint(x: 0, y:-(dropDown.anchorView?.plainView.bounds.height)!)
        toDropDown.direction = .any
        DropDown.startListeningToKeyboard()        //dropDown.dataSource = ["Car", "Motorcycle", "Truck"]

                var dropDownList = [""]
                var dropDownList2 = [""]
        
    
        
        DataService.shared.fetchData{(result) in
                    switch result {
                        case .success(let gists):
                            for gist in gists {
                            let list =  gist.source
                            let numberCount = list.count
                            dropDownList = [String]()
                            dropDownList.reserveCapacity(numberCount)
                            for listItem in list {
                            dropDownList.append(listItem.port)}
                                //for 2nd drop down
                            dropDownList2 = [String]()
                            dropDownList2.reserveCapacity(numberCount)
                            for listItem in gist.destination {
                                dropDownList2.append(listItem.port)}
                    }
                        self.dropDown.dataSource = dropDownList

                        self.toDropDown.dataSource = dropDownList2
                  case .failure(let _error):
                       print(_error)
                    }
                    self.dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                      self.fromLocationLabel.text = dropDownList[index]
                      print("Selected item: \(item) at index: \(index)")
                    }
            self.toDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                self.toLocationLabel.text = dropDownList2[index]
              print("Selected item: \(item) at index: \(index)")
            }                }
        
        // Do any additional setup after loading the view.
        viewWillDisappear(true)
        dropDownTextField1.underlined(color: .darkGray)
        dropDownTextField2.underlined(color: .darkGray)
        dateTxt.underlined(color: .darkGray)
        
        let backgroundImage = UIImage.init(named: "LaunchScreen-AspectFill.png")
            let backgroundImageView = UIImageView.init(frame: self.view.frame)

            backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleToFill

            self.view.insertSubview(backgroundImageView, at: 0)
        createDatePicker()
       //fromLocation.optionArray = ["option1", "option-2", "Option-3"]
       //fromLocation.optionIds = [1,23,54,22]
        
        //toLocation.optionArray = ["option1", "option-2", "Option-3"]
        //toLocation.optionIds = [1,23,54,22]
        
    }
    
    func createDatePicker(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //barbutton
        let doneBtn =  UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        //assign toolbar
        dateTxt.inputAccessoryView = toolbar
        //assign date picket to the text field
        
        dateTxt.inputView = datePicker
        
        
        datePicker.datePickerMode = .date
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func donePressed(){
        //formatter
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        dateTxt.text = formatter.string(from:datePicker.date)
        self.view.endEditing(true)
    }
}

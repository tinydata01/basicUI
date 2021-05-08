//
//  DashboardViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

import iOSDropDown
class DashboardViewController: UIViewController {
    //@IBOutlet var dateTxt: UITextField!
    let datePicker = UIDatePicker()
   
    //@IBOutlet var fromLocation: DropDown!
    
    //@IBOutlet var toLocation: DropDown!
     @IBOutlet var dateTxt: UITextField!
    //@IBOutlet var fromLocation: DropDown!
    
   
    //@IBOutlet var datePicker: UITextField!
    //@IBOutlet var toLocation: DropDown!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewWillDisappear(true)
        //fromLocation.underlined(color: .darkGray)
        //toLocation.underlined(color: .darkGray)
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

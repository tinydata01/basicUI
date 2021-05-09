//
//  DashboardViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit
import DropDown

class DashboardViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{
    //@IBOutlet var dateTxt: UITextField!
    let datePicker = UIDatePicker()
    
   
    @IBOutlet var textBox: UITextField!
    
    @IBOutlet var dropDown: UIPickerView!
    var list = ["1","2","3"]
    
   // @IBOutlet var fromLocation: UITextField!
       @IBOutlet var toLocation: UITextField!
       @IBOutlet var dateTxt: UITextField!
    let toLocationDropDown = DropDown()
    let fromLocationDropDown = DropDown()
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewWillDisappear(true)
        //fromLocation.underlined(color: .darkGray)
        toLocation.underlined(color: .darkGray)
        dateTxt.underlined(color: .darkGray)
        dateTxt.rightView = UIImageView(image: UIImage(named: "calendar"))
        dateTxt.rightViewMode = .always
        let backgroundImage = UIImage.init(named: "LaunchScreen-AspectFill.png")
            let backgroundImageView = UIImageView.init(frame: self.view.frame)

            backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleToFill

            self.view.insertSubview(backgroundImageView, at: 0)
        createDatePicker()
            
            toLocationDropDown.anchorView = toLocation
            //fromLocationDropDown.anchorView = //fromLocation
            toLocationDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
            fromLocationDropDown.dataSource = ["Car", "Motorcycle", "Truck"]
            
            //dropDown_1.show()
            // fromLocation.optionArray = ["option1", "option-2", "Option-3"]
       //fromLocation.optionIds = [1,23,54,22]
        
        //toLocation.optionArray = ["option1", "option-2", "Option-3"]
       // toLocation.optionIds = [1,23,54,22]
        
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
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
    return 1

}

public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{

    return list.count

}

func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

    self.view.endEditing(true)
    return list[row]

}

func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    self.textBox.text = self.list[row]
    self.dropDown.isHidden = true

}

func textFieldDidBeginEditing(_ textField: UITextField) {

    if textField == self.textBox {
        self.dropDown.isHidden = false
        //if you dont want the users to se the keyboard type:

        textField.endEditing(true)
    }

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

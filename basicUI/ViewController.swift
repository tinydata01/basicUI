//
//  ViewController.swift
//  basicUI
//
//  Created by user187847 on 4/5/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var _password: UITextField!
    @IBOutlet var _email: UITextField!
    
    @IBOutlet var _loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: _email, andImage: emailImage!)
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: _password, andImage: passwordImage!)

        
    }

    func addLeftImageTo(txtField:UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }
    
}


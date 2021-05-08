//
//  ViewController.swift
//  skeleton
//
//  Created by user189922 on 5/7/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var _email: UITextField!
    
    @IBOutlet var _loginButton: UIView!
    
    @IBOutlet var _password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewWillDisappear(true)
        // Do any additional setup after loading the view.
           let emailImage = UIImage(named:"mail")
        addLeftImageTo(txtField: _email, andImage: emailImage!)
        
        let passwordImage = UIImage(named:"password")
        addLeftImageTo(txtField: _password, andImage: passwordImage!)
        _loginButton.layer.cornerRadius = 10
        //_email.borderStyle = .none
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named: "loginBackground.png")!)    // 1- this will add it with the default
    self.addBackground()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.setNavigationBarHidden(true, animated: animated)
}

override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.setNavigationBarHidden(false, animated: animated)
}

func addLeftImageTo(txtField:UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
}
    
    func addBackground() {
    // screen width and height:
        let width  = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
    let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
    imageViewBackground.image = UIImage(named: "loginBackground")

    // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.view.addSubview(imageViewBackground)
        self.view.sendSubviewToBack(imageViewBackground)
}
     
}


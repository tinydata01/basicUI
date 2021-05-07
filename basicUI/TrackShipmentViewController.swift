//
//  TrackShipmentViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class TrackShipmentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

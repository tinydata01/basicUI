//
//  DashboardViewController.swift
//  basicUI
//
//  Created by user189922 on 5/7/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewWillDisappear(true)
        let backgroundImage = UIImage.init(named: "LaunchScreen-AspectFill.png")
            let backgroundImageView = UIImageView.init(frame: self.view.frame)

            backgroundImageView.image = backgroundImage
        backgroundImageView.contentMode = .scaleToFill

            self.view.insertSubview(backgroundImageView, at: 0)
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

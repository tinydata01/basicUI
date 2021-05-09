//
//  CardCell.swift
//  basicUI
//
//  Created by user189922 on 5/8/21.
//  Copyright © 2021 user187847. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
 
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var sourceDateValue: UILabel!
    @IBOutlet weak var destinationDateValue: UILabel!
    @IBOutlet weak var requestButton: UIButton!
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    func configure(picture: UIImage, title: String, destination: String, source: String, sourceDate: String, destinationDate: String){
        
        pictureView.image = picture
        titleLabel.text = title
        destinationLabel.text = destination
        destinationDateValue.text = destinationDate
        sourceDateValue.text = sourceDate
        sourceLabel.text = source
        
        requestButton.layer.cornerRadius = 10.0
        
        cardView.layer.shadowColor = UIColor.gray.cgColor
        cardView.layer.shadowOffset = CGSize(width: 1.0, height: 2.0)
        cardView.layer.shadowOpacity = 1.0
        cardView.layer.masksToBounds = false
        cardView.layer.cornerRadius = 10.0
    }

}

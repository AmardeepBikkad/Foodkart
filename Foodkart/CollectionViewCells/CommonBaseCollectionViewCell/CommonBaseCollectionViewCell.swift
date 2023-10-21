//
//  CommonBaseCollectionViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 20/10/23.
//

import UIKit

class CommonBaseCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var offer1Label: UILabel!
    @IBOutlet weak var offer2Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.layer.cornerRadius = 5
        // Initialization code
    }

    func setOffersLabelTitleAndColor(index: Int, offersArray: [Offers]) {
        if offersArray.count != 0 {
            offer2Label.text = ""
            offer1Label.text = ""
            if offersArray.count == 1 {
                offer1Label.text = offersArray[0].name
                offer1Label.textColor = UIColor(hexString: offersArray[0].textcolor ?? "")
                offer1Label.backgroundColor = UIColor(hexString: offersArray[0].background ?? "")
                
            } else if offersArray.count == 2 {
                offer1Label.text = offersArray[0].name
                offer1Label.textColor =  UIColor(hexString: offersArray[0].textcolor ?? "")
                offer1Label.backgroundColor = UIColor(hexString: offersArray[0].background ?? "")
                offer2Label.text = offersArray[1].name
                offer2Label.textColor =  UIColor(hexString: offersArray[1].textcolor ?? "")
                offer2Label.backgroundColor = UIColor(hexString: offersArray[1].background ?? "")
            }
        }
    }
}

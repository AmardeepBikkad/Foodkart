//
//  OffersCollectionViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 21/10/23.
//

import UIKit

class OffersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var offerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        // Initialization code
    }
}

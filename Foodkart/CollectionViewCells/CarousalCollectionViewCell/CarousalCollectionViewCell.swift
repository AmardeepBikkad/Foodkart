//
//  CarousalCollectionViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 20/10/23.
//

import UIKit

class CarousalCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannerImageView.layer.cornerRadius = 10
        bannerImageView.layer.masksToBounds = true
        // Initialization code
    }

}

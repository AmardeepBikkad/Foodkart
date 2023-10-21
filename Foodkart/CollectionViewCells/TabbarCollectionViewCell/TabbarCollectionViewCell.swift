//
//  TabbarCollectionViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import UIKit

class TabbarCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var tabbarTitleLabel: UILabel!
    @IBOutlet weak var tabbarImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func updateCellData(_ index: Int) {
        tabbarImageView.tintColor = index == 0 ? .red : .gray
        tabbarTitleLabel.textColor = index == 0 ? .red : .gray
        tabbarTitleLabel.text = tabbarItemArray[index]
//        tabbarImageView.image = UIImage(named: String(describing: tabbarItemImages[index]))
    }
}

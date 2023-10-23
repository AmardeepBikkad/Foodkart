//
//  BannerTableViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 23/10/23.
//

import UIKit

class BannerTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bannersCollectionView: UICollectionView!
    var banners = [Banners]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bannersCollectionView.register(UINib(nibName: categoryCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: categoryCollectionViewCellIdentifier)
        bannersCollectionView.dataSource = self
        bannersCollectionView.delegate = self
        // Initialization code
    }
}

extension BannerTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
    

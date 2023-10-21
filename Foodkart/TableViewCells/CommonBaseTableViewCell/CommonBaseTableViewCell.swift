//
//  CommonBaseTableViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import UIKit

class CommonBaseTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryTitleLabel: UILabel!
    @IBOutlet weak var commonBaseCollectionView: UICollectionView!
    var offerCollections = [OfferCollections]()
    var isRestaurant = false
    var restaurants = [Restaurants]()
    var offers = [Offers]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        let cellArray = [offersCollectionViewCellIdentifier, commonBaseCollectionViewCellIdentifier]
        for eachCell in cellArray {
            commonBaseCollectionView.register(UINib(nibName: eachCell, bundle: nil), forCellWithReuseIdentifier: eachCell)
        }
        commonBaseCollectionView.dataSource = self
        commonBaseCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension CommonBaseTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isRestaurant ? restaurants.count : offerCollections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if isRestaurant {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: commonBaseCollectionViewCellIdentifier, for: indexPath) as? CommonBaseCollectionViewCell {
                cell.titleLabel.text = restaurants[indexPath.row].name ?? ""
                cell.imageView.getImageFromUrl(from: restaurants[indexPath.row].imageUrl ?? "")
                cell.ratingLabel.text = String(restaurants[indexPath.row].rating ?? 0.0)
                cell.timeLabel.text = restaurants[indexPath.row].displayDistance ?? ""
                cell.setOffersLabelTitleAndColor(index: indexPath.row, offersArray: offers)
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: offersCollectionViewCellIdentifier, for: indexPath) as? OffersCollectionViewCell {
                cell.imageView.getImageFromUrl(from: offerCollections[indexPath.row].image ?? "")
                cell.offerLabel.text = offerCollections[indexPath.row].name?.uppercased() ?? ""
                return cell
            }
        }
         
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if isRestaurant {
            return CGSize(width: (commonBaseCollectionView.bounds.width / 2) - 30, height: commonBaseCollectionView.bounds.height)
        } else {
            return CGSize(width: (commonBaseCollectionView.bounds.width / 2) - 10, height: (commonBaseCollectionView.bounds.height / 2) - 5)
        }
    }
}

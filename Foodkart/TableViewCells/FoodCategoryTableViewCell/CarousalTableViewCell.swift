//
//  CarousalTableViewCell.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import UIKit

class CarousalTableViewCell: UITableViewCell {
    @IBOutlet weak var carousalCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var voucherNumberLabel: UILabel!
    var carousalData = [Banners]()
    var foodCategories = [FoodCategories]()
    var noOfVouchers = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
        voucherNumberLabel.text = "You have \(noOfVouchers) voucher here"
        // Initialization code
    }
    
    private func registerCells() {
        carousalCollectionView.register(UINib(nibName: carousalCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: carousalCollectionViewCellIdentifier)
        categoryCollectionView.register(UINib(nibName: categoryCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: categoryCollectionViewCellIdentifier)
        carousalCollectionView.delegate = self
        carousalCollectionView.dataSource = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}


extension CarousalTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == carousalCollectionView {
            print(carousalData.count)
            return carousalData.count
        } else {
            return foodCategories.count 
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == carousalCollectionView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: carousalCollectionViewCellIdentifier, for: indexPath) as? CarousalCollectionViewCell {
                cell.bannerImageView.getImageFromUrl(from: carousalData[indexPath.row].imageUrl ?? "")
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: categoryCollectionViewCellIdentifier, for: indexPath) as? CategoryCollectionViewCell {
                cell.categoryImageView.getImageFromUrl(from: foodCategories[indexPath.row].icon ?? "")
                cell.categoryTitleLabel.text = foodCategories[indexPath.row].name
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == carousalCollectionView {
            return CGSize(width: UIScreen.main.bounds.width - 50, height: 110)
        } else {
            return CGSize(width: (UIScreen.main.bounds.width/3)-50 , height: 90)
        }
    }
    
    
}

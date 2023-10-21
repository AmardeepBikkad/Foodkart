//
//  HomeViewController.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import UIKit
import AVFoundation

class HomeViewController: UIViewController {
//    var homeViewModel: HomeViewModelProtocol!
    @IBOutlet weak var topBarView: UIView!
    @IBOutlet weak var topBarViewHeight: NSLayoutConstraint!
    @IBOutlet weak var bottomTabbarCollectionView: UICollectionView!
    @IBOutlet weak var homeTableView: UITableView!
    
    var homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        callHomeDataAPI()
        registerCells()
        setDelegateAndDataSource()
    }
    
    private func callHomeDataAPI() {
        homeViewModel.getHomeModelData { isSuccess in
            if isSuccess {
                DispatchQueue.main.async {
                    self.homeTableView.reloadData()
                }
            }
        }
    }
    
    private func registerCells() {
        bottomTabbarCollectionView.register(UINib(nibName: tabbarCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: tabbarCollectionViewCellIdentifier)
        
        let cellsArray = [carousalTableViewCellIdentifier, commonBaseTableViewCellIdentifier]
        for eachCell in cellsArray {
            let nib = UINib(nibName: eachCell, bundle: nil)
            homeTableView.register(nib, forCellReuseIdentifier: eachCell)
        }
    }
    
    private func setDelegateAndDataSource() {
        bottomTabbarCollectionView.delegate = self
        bottomTabbarCollectionView.dataSource = self
        homeTableView.dataSource = self
        homeTableView.delegate = self
    }
}

//table view data source and delegate methods
extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.tableViewObjects.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: carousalTableViewCellIdentifier, for: indexPath) as? CarousalTableViewCell {
                cell.carousalData = homeViewModel.homeData?.banners ?? []
                cell.foodCategories = homeViewModel.homeData?.foodCategories ?? []
                cell.noOfVouchers = homeViewModel.homeData?.numberOfActiveVouchers ?? 0
                cell.carousalCollectionView.reloadData()
                cell.categoryCollectionView.reloadData()
                return cell
            }
        } else if indexPath.row == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: commonBaseTableViewCellIdentifier, for: indexPath) as? CommonBaseTableViewCell {
                cell.categoryTitleLabel.text = "Collections"
                cell.offerCollections = homeViewModel.homeData?.offerCollections ?? []
                cell.commonBaseCollectionView.reloadData()
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: commonBaseTableViewCellIdentifier, for: indexPath) as? CommonBaseTableViewCell {
                let restaurant = homeViewModel.tableViewObjects[indexPath.row] as? RestaurantCollections
                cell.isRestaurant = true
                cell.categoryTitleLabel.text = restaurant?.name
                cell.offers = restaurant?.restaurants?[indexPath.row].offers ?? []
                cell.restaurants = restaurant?.restaurants ?? []
                cell.commonBaseCollectionView.reloadData()
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            //for banner and categories
            return 240
        } else if indexPath.row == 1 {
            //for offer collection
            return 120
        } else {
            //handling for restaurants
            return 185
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabbarItemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: tabbarCollectionViewCellIdentifier, for: indexPath) as? TabbarCollectionViewCell else {return UICollectionViewCell()}
        cell.updateCellData(indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (bottomTabbarCollectionView.frame.width/3) - 10, height: bottomTabbarCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 22, right: 0)
    }
}

extension HomeViewController: HomeViewModelProtocol {
    func updateUIOnHome() {
        homeTableView.reloadData()
    }
}

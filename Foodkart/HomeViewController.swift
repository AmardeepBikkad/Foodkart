//
//  ViewController.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 17/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    var homeViewModel: HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeViewModel?.getHomeModelData()
    }
    
}

extension HomeViewController: HomeViewModelProtocol {
    func updateUIOnHome() {
        print("reload data after api success")
    }
}



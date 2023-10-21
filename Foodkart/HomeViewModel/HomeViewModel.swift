//
//  HomeViewModel.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 19/10/23.
//

import Foundation

protocol HomeViewModelProtocol: AnyObject {
    func updateUIOnHome()
}

class HomeViewModel: NSObject {
    weak var delegateToHomeVC: HomeViewModelProtocol?
    var homeData: HomeData?
    var tableViewObjects = [Any]()
    
    func getHomeModelData(completion: @escaping (Bool)-> Void) {
        let request = ApiManager.sharedManager.getURLRequest(path: homeDataUrl)
        
        ApiManager.sharedManager.getReponse(request: request, reponseModelType: HomeDataModel.self) { response in
            if response.isSuccess {
//                RJILApiManager.populateDataStore(model: newModel, id: urlID)
                self.homeData = response.model?.data
                self.appendDataTOTableViewObjects()
                completion(response.isSuccess)
//                self?.delegateToHomeVC?.updateUIOnHome()
            } else {
                print("handle tasks after api failure")
            }
        }
    }
    
    func appendDataTOTableViewObjects() {
        tableViewObjects.append(homeData?.banners ?? [])
        tableViewObjects.append(homeData?.offerCollections ?? [])
        for eachRestaurant in homeData?.restaurantCollections ?? [] {
            tableViewObjects.append(eachRestaurant)
        }
    }
}

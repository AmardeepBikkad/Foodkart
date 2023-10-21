//
//  HomeModel.swift
//  Foodkart
//
//  Created by Amardeep Bikkad on 17/10/23.
//

import Foundation

import Foundation
struct HomeDataModel: Codable {
    let status: Int?
    let data: HomeData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? values.decodeIfPresent(Int.self, forKey: .status)
        data = try? values.decodeIfPresent(HomeData.self, forKey: .data)
    }
}

struct HomeData: Codable {
  var banners: [Banners]?
  var foodCategories: [FoodCategories]?
  var numberOfActiveVouchers: Int?
  var offerCollections: [OfferCollections]?
  var restaurantCollections: [RestaurantCollections]?

  enum CodingKeys: String, CodingKey {
    case banners = "banners"
    case foodCategories = "food_categories"
    case numberOfActiveVouchers = "number_of_active_vouchers"
    case offerCollections = "offer_collections"
    case restaurantCollections = "restaurant_collections"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    banners = try? values.decodeIfPresent([Banners].self, forKey: .banners)
    foodCategories = try? values.decodeIfPresent([FoodCategories].self, forKey: .foodCategories)
    numberOfActiveVouchers = try? values.decodeIfPresent(Int.self                     , forKey: .numberOfActiveVouchers)
    offerCollections = try? values.decodeIfPresent([OfferCollections].self, forKey: .offerCollections)
    restaurantCollections = try? values.decodeIfPresent([RestaurantCollections].self, forKey: .restaurantCollections )
  }
}


struct Banners: Codable {
  var imageUrl : String?
  var id : Int?

  enum CodingKeys: String, CodingKey {
    case imageUrl = "image_url"
    case id = "id"
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    imageUrl = try? values.decodeIfPresent(String.self, forKey: .imageUrl )
    id = try? values.decodeIfPresent(Int.self, forKey: .id)
 
  }
}

struct FoodCategories: Codable {
    var name: String?
    var id: Int?
    var icon: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case icon = "icon"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        icon = try? values.decodeIfPresent(String.self, forKey: .icon)
    }
}

struct OfferCollections: Codable {
    var name: String?
    var id: Int?
    var image: String?
    var textcolor: String?
    var background : String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case image = "image"
        case textcolor = "textcolor"
        case background = "background"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try? values.decodeIfPresent(String.self , forKey: .name)
        id = try? values.decodeIfPresent(Int.self    , forKey: .id)
        image = try? values.decodeIfPresent(String.self , forKey: .image)
        textcolor = try? values.decodeIfPresent(String.self , forKey: .textcolor )
        background = try? values.decodeIfPresent(String.self , forKey: .background)
    }
}

struct RestaurantCollections: Codable {
    var name: String?
    var priority: Int?
    var restaurants: [Restaurants]?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case priority = "priority"
        case restaurants = "restaurants"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        priority = try? values.decodeIfPresent(Int.self, forKey: .priority)
        restaurants = try? values.decodeIfPresent([Restaurants].self, forKey: .restaurants)
    }
}

struct Restaurants: Codable {
    var id: Int?
    var name: String?
    var displayDistance: String?
    var rating: Double?
    var imageUrl: String?
    var offers: [Offers]?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case displayDistance = "display_distance"
        case rating = "rating"
        case imageUrl = "image_url"
        case offers = "offers"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        displayDistance = try? values.decodeIfPresent(String.self, forKey: .displayDistance)
        rating = try? values.decodeIfPresent(Double.self, forKey: .rating)
        imageUrl = try? values.decodeIfPresent(String.self, forKey: .imageUrl)
        offers = try? values.decodeIfPresent([Offers].self, forKey: .offers)
    }
}


struct Offers: Codable {
    var name: String?
    var id: Int?
    var textcolor: String?
    var background: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case id = "id"
        case textcolor = "textcolor"
        case background = "background"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        name = try? values.decodeIfPresent(String.self, forKey: .name)
        id = try? values.decodeIfPresent(Int.self, forKey: .id)
        textcolor = try? values.decodeIfPresent(String.self , forKey: .textcolor )
        background = try? values.decodeIfPresent(String.self , forKey: .background)
    }
}

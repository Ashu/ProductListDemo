//
//  Product.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

struct Product: Codable {
    var citrusID: String?
    var title: String?
    var id: String?
    var imageURL: String?
    var price: [Price]?
    var brand: String?
    var badges: [String]?
    var ratingCount: Double?
    var isAddToCartEnable: Bool?
    var addToCartButtonText: String?
    var isInTrolley: Bool?
    var isInWishlist: Bool?
    var isFindMeEnable: Bool?
    var saleUnitPrice: Double?
    var totalReviewCount: Int?
    var isDeliveryOnly: Bool?
    var isDirectFromSupplier: Bool?
    var isFavorite: Bool? = false
}

struct Price: Codable {
    var message: String?
    var value: Double?
    var isOfferPrice: Bool?
}

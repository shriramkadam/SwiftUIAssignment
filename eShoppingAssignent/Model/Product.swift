//
//  Product.swift
//  eShoppingAssignent
//
//  Created by Shriram Kadam on 11/12/22.
//


import Foundation

struct ShoppingItem : Decodable {
    let products : [Product]

    enum CodingKeys: String, CodingKey {
        case products = "products"
    }
}

// MARK: - Product
struct Product: Decodable {
    let title, id: String?
    let imageURL: String?
    let price: [Price]
    let brand: String?
    let ratingCount: Double?
    let isAddToCartEnable: Bool?
    let isInWishlist: Bool?
    let totalReviewCount: Int?

    enum CodingKeys: String, CodingKey {
        case title, id, imageURL, price, brand, ratingCount, isAddToCartEnable, isInWishlist, totalReviewCount
    }
}

// MARK: - Price
struct Price: Decodable {
    let message: Message
    let value: Double?
    let isOfferPrice: Bool?
}

enum Message: String, Codable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}


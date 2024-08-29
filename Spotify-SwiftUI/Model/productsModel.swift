//
//  productsModel.swift
//  Spotify-SwiftUI
//
//  Created by Gulam Ali on 28/07/24.
//

import Foundation

// MARK: - Products Array
struct ProductsArray: Codable {
    let products: [Product]
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description, category: String
//    let price, discountPercentage, rating: Double
//    let stock: Int
//    let tags: [String]
//    let brand, sku: String
//    let weight: Int
//    let warrantyInformation, shippingInformation, availabilityStatus: String
//    let returnPolicy: String
//    let minimumOrderQuantity: Int
    let thumbnail: String
    let images: [String]
    var firstImage : String {
        images.first ?? constants.randomImage
    }
}

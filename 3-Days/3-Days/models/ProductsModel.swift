//
//  ProductsModel.swift
//  3-Days
//
//  Created by HAKAN ÖZER on 12.10.2023.
//

import Foundation


// MARK: - ProductsModel
struct ProductsModel: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let title, description: String
    let price: Int
    let discountPercentage, rating: Double
    let stock: Int
    let brand, category: String
    let thumbnail: String
    let images: [String]
}

//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

struct MlinkEvent {
    let userId: Int
    let lineItems: [Int]
    let products: [MlinkProduct]?
    
    enum CodingKeys: String, CodingKey {
        case userId = "UserID"
        case lineItems = "LineItems"
        case products = "Products"
    }
}

struct MlinkProduct {
    let barcode: Int
    let quantity: Int
    let price: Double
    
    enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case quantity = "Quantity"
        case price = "Price"
    }
}

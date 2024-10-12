//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

public struct MlinkEventPayload {
    
    public init(userId: Int, lineItems: [Int], products: [MlinkEventProduct]?) {
        self.userId = userId
        self.lineItems = lineItems
        self.products = products
    }
    
    let userId: Int?
    let lineItems: [Int]?
    let products: [MlinkEventProduct]?
    
    enum CodingKeys: String, CodingKey {
        case userId = "UserID"
        case lineItems = "LineItems"
        case products = "Products"
    }
}

public struct MlinkEventProduct {
    let barcode: Int?
    let quantity: Int?
    let price: Double?
    
    public init(barcode: Int, quantity: Int, price: Double) {
        self.barcode = barcode
        self.quantity = quantity
        self.price = price
    }
    
    enum CodingKeys: String, CodingKey {
        case barcode = "Barcode"
        case quantity = "Quantity"
        case price = "Price"
    }
}

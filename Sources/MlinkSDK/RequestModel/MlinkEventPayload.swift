

import Foundation

public struct MlinkEventPayload {
    
    public init(userId: Int, adIDList: [Int], products: [MlinkEventProduct]?) {
        self.userId = userId
        self.adIDList = adIDList
        self.products = products
    }
    
    let userId: Int?
    let adIDList: [Int]?
    let products: [MlinkEventProduct]?
    
    enum CodingKeys: String, CodingKey {
        case userId = "UserID"
        case adIDList = "AddIDList"
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

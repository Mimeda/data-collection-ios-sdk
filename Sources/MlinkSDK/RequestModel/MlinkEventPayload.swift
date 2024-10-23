

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
}

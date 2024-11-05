

import Foundation

public struct MlinkEventPayload {
    
    public init(userId: Int? = nil,
                categoryId: String? = nil,
                keyword: String? = nil,
                totalRowCount: Int? = nil,
                transactionId: Int? = nil,
                products: [MlinkEventProduct]? = nil) {
        self.userId = userId
        self.categoryId = categoryId
        self.keyword = keyword
        self.totalRowCount = totalRowCount
        self.transactionId = transactionId
        self.products = products
    }
    
    let userId: Int?
    let categoryId: String?
    let keyword: String?
    let totalRowCount: Int?
    let transactionId: Int?
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

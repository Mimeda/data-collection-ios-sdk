
import Foundation

public struct MlinkEventPayload: ServiceModelProvidable {
    
    var userId: Int?
    let categoryId: String?
    let keyword: String?
    let totalRowCount: Int?
    let transactionId: String?
    let products: [MlinkEventProduct]?
    let lineItemIds: [Int]?
    let website: String?
    let loyaltyCard: String?
    public init(userId: Int? = nil,
                categoryId: String? = nil,
                keyword: String? = nil,
                totalRowCount: Int? = nil,
                transactionId: String? = nil,
                products: [MlinkEventProduct]? = nil,
                lineItemIds: [Int]? = nil,
                website: String? = nil,
                loyaltyCard: String? = nil
    ) {
        self.userId = userId
        self.categoryId = categoryId
        self.keyword = keyword
        self.totalRowCount = totalRowCount
        self.transactionId = transactionId
        self.products = products
        self.lineItemIds = lineItemIds
        self.website = website
        self.loyaltyCard = loyaltyCard
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
}

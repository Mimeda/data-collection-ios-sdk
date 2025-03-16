//
//  MlinkAdPayload.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//

public struct MlinkAdPayload: ServiceModelProvidable, Codable{
    let lineItemId: Int?
    let creativeId: Int?
    let adUnit: String?
    let keyword: String?
    let productSku: String?
    var userId: Int?
    let payload: String?
    let website: String?
    let loyaltyCard: String?
    public init(lineItemId: Int?, creativeId: Int?, adUnit: String?, keyword: String?, userId: Int? = nil, productSku: String?, payload: String?, website: String? = nil, loyaltyCard: String? = nil) {
        self.userId = userId
        self.lineItemId = lineItemId
        self.creativeId = creativeId
        self.adUnit = adUnit
        self.keyword = keyword
        self.productSku = productSku
        self.payload = payload
        self.website = website
        self.loyaltyCard = loyaltyCard
    }
   
}


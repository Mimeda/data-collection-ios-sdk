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
    
    public init(lineItemId: Int?, creativeId: Int?, adUnit: String?, keyword: String?, userId: Int? = nil, productSku: String?, payload: String?) {
        self.userId = userId
        self.lineItemId = lineItemId
        self.creativeId = creativeId
        self.adUnit = adUnit
        self.keyword = keyword
        self.productSku = productSku
        self.payload = payload
    }
   
}


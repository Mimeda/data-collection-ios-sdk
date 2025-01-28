//
//  MlinkAdPayload.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//

public struct MlinkAdPayload: ServiceModelProvidable {
    let lineItemId: Int?
    let creativeId: Int?
    let adUnit: String?
    let keyword: String?
    var userId: Int?
    
    public init(lineItemId: Int?, creativeId: Int?, adUnit: String?, keyword: String?, userId: Int?) {
        self.userId = userId
        self.lineItemId = lineItemId
        self.creativeId = creativeId
        self.adUnit = adUnit
        self.keyword = keyword
    }
    
}

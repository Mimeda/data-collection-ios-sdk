//
//  URLConstants.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//

final class URLConstants {
    
    enum PublisherEventConstants: String {
     // App Constants
     case version               = "v"
     case publisher             = "pub"
     case timeStamp             = "t"
     case deviceId              = "d"
     case anonId                = "aid"
     case userId                = "uid"
     case language              = "lng"
     case platform              = "p"
     case sessionId             = "s"
     case eventName             = "en"
     case eventParameter        = "ep"
     case lineItemIds           = "li"
     case applicationId         = "appid"
     // Model Constants
     case productList           = "pl"
     case categoryId            = "ct"
     case keyword               = "kw"
     case transactionId         = "trans"
     case totalRowCount         = "trc"
    }
    
    enum AdEventConstants: String {
        // App Constants
        case lineItemId        = "li"
        case creativeId        = "c"
        case adUnit            = "au"
        case keyword           = "kw"
        case anonymousId       = "aid"
        case timestamp         = "t"
        case sessionId         = "s"
        case productSku        = "psku"
        case payload           = "pyl"
        // Model Constants
        case userId            = "uid"
    }
}

//
//  BaseURL.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//

enum BaseURL {
    case adPayLoad
    case eventPayLoad
    var baseURL: String {
        switch self {
        case .adPayLoad:
            return "https://bidding-prfmnccollector.azurewebsites.net"
        case .eventPayLoad:
            return "https://bidding-eventcollector.azurewebsites.net"
        }
    }
}

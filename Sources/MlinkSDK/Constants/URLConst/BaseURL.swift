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
            return "https://performance.mlink.com.tr"
        case .eventPayLoad:
            return "https://event.mlink.com.tr"
        }
    }
}

//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

public enum MlinkEnvironment {
    case dev
    case staging
    case prod
}

extension MlinkEnvironment {
    var urlString: String {
        switch self {
        case .dev:
            return "https://collector.avvamobiledemo.com/im.gif?"
        case .staging:
            return "https://mlink-dc.avvamobiledemo.com/im.gif?"
        case .prod:
            return "https://s.mlink.com.tr/im.gif?"
        }
    }
}

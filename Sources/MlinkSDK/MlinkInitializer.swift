//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

final public class MlinkInitializer {
    static var baseDomain: String?
    static var appId: Int!
    static var environment: MlinkEnvironment = .staging
    
    /// Initialize
    /// - Parameters:
    ///   - baseDomain: Optional parameter for initialization because there is already default domain.
    ///   - appId: Obligatory parameter for initialization.
    ///   - environment: Emphasize that whether prod or staging.
    static public func initialize(baseDomain: String? = nil, appId: Int, environment: MlinkEnvironment) {
        MlinkInitializer.baseDomain = baseDomain
        MlinkInitializer.appId = appId
        MlinkInitializer.environment = environment
        
        // Initialize Request
    }
}

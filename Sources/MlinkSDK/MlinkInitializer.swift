//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

final public class MlinkInitializer {
    static var appId: Int!
    static var publisher: String!
    static var isLogEnabled: Bool!
    
    static var version: String = "1.0.0.0"
    static var isInitialized: Bool = false
    
    
    /// Description
    /// - Parameters:
    ///   - appId: obligatory appId pass during initialize
    ///   - publisher: obligatory publisher pass during initialize
    ///   - isLogEnabled: optional isLogEnabled pass during initialize, default true
    static public func initialize(appId: Int, publisher: String, isLogEnabled: Bool = true) {
        MlinkInitializer.appId = appId
        MlinkInitializer.publisher = publisher
        MlinkInitializer.isLogEnabled = isLogEnabled
        MlinkInitializer.isInitialized = true
    }
}

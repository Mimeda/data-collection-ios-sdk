

import Foundation

final public class Mlink {
    static var appId: String!
    static var publisher: String!
    static var isLogEnabled: Bool!
    static var website: String!
    static var version: String = "1.1.0"
    static var isInitialized: Bool = false
    
    
    /// Description
    /// - Parameters:
    ///   - appId: obligatory appId pass during initialize
    ///   - publisher: obligatory publisher pass during initialize
    ///   - isLogEnabled: optional isLogEnabled pass during initialize, default true
    static public func initialize(appId: String, publisher: String, isLogEnabled: Bool = true, website: String) {
        Mlink.appId = appId
        Mlink.publisher = publisher
        Mlink.isLogEnabled = isLogEnabled
        Mlink.isInitialized = true
        Mlink.website = website
    }
}

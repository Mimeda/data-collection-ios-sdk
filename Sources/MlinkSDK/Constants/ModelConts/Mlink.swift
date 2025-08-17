

import Foundation

final public class Mlink {
    static var app: String!
    static var isLogEnabled: Bool!
    static var version: String = "1.1.3"
    static var isInitialized: Bool = false
    
    
    /// Description
    /// - Parameters:
    ///   - appId: obligatory appId pass during initialize
    ///   - publisher: obligatory publisher pass during initialize
    ///   - isLogEnabled: optional isLogEnabled pass during initialize, default true
    static public func initialize(app: String, isLogEnabled: Bool = true) {
        Mlink.app = app
        Mlink.isLogEnabled = isLogEnabled
        Mlink.isInitialized = true
    }
}

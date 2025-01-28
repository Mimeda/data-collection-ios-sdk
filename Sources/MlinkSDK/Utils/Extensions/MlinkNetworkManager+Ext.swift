//
//  MlinkNetworkManager+Ext.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//
import Foundation

extension IMlinkNetwork {
    private func logger(input: some Equatable, isSuccess: Bool) {
        if Mlink.isLogEnabled {
            print("Mlink Event \(isSuccess ? "Success" : "Error"): \(input)")
        }
    }
     var configureSessionId: String {
        if let sessionParamater = UserDefaults.standard.dictionary(forKey: "session_parameter") {
            if let createdTime = sessionParamater["created_time"] as? Double {
                let now = Date.now
                let createdDate = Date(timeIntervalSinceReferenceDate: createdTime)
                let diffMinute = getMinutesDifferenceFromTwoDates(start: createdDate, end: now)
                if diffMinute > 30 {
                    return createUUID()
                }
            }
            
            guard let sessionId = sessionParamater["session_id"] as? String else {
                return createUUID()
            }
            return sessionId
        }
        return createUUID()
    }

    private func createUUID() -> String {
        var parameters: [String:Any] = [:]
        let newSessionId = UUID().uuidString
        parameters["session_id"] = newSessionId
        parameters["created_time"] = Date.now.timeIntervalSinceReferenceDate
        UserDefaults.standard.setValue(parameters, forKey: "session_parameter")
        return newSessionId
    }
    
    private func getMinutesDifferenceFromTwoDates(start: Date, end: Date) -> Int {
        let diff = Int(end.timeIntervalSince1970 - start.timeIntervalSince1970)
        let hours = diff / 3600
        let minutes = (diff - hours * 3600) / 60
        return minutes
    }
}

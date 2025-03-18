//
//  MlinkAdNetworkManager.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//
import Foundation

final class MlinkAdNetworkManager: IMlinkNetwork {
 
    typealias payloadType = MlinkAdPayload
    func baseRequest(with payload: MlinkAdPayload, en: String, state: NetworkEventState) {
        
        guard Mlink.isInitialized else {
            print("Mlink: You need to initialize SDK first.")
            return
        }
        
        
        guard let url = configureURL(with: payload, en: en, state: state) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en)")
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en)")
                }
                return
            }
            
            guard Range(200...300).contains(response.statusCode) else {
                
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en)")
                }
                return
            }
            if Mlink.isLogEnabled {
                print("Mlink: Success - \(en)")
            }
            
        }
        
        task.resume()
    }
    
    private func configureURL(with payload: MlinkAdPayload, en: String, state: NetworkEventState) -> URL? {
        
        let baseURL = BaseURL.adPayLoad.baseURL
       
        let queryItemDict: [URLConstants.AdEventConstants: String?] = [
            .lineItemId: "\(payload.lineItemId!)",
            .creativeId: "\(payload.creativeId!)",
            .adUnit: "\(payload.adUnit!)",
            .keyword: "\(payload.keyword!)",
            .productSku: payload.productSku,
            .payload: payload.payload,
            .anonymousId: UUID().uuidString,
            .userId: String(payload.userId ?? 0),
            .timestamp: "\(Int64(Date.timeIntervalSinceReferenceDate))",
            .sessionId: configureSessionId,
            .website: Mlink.website,
            .loyaltyCard: payload.loyaltyCard
    
        ]
        
        let queryItems = queryItemDict.compactMap { key, value in
            value.map { URLQueryItem(name: key.rawValue, value: $0) }
        }
        
        var urlComponents = URLComponents(string: baseURL)
        
        switch state {
        case .click:
            urlComponents?.path = "/clicks"
        case .impression:
            urlComponents?.path = "/impressions"
           
        }
        urlComponents?.queryItems = queryItems
                
        return urlComponents?.url
    }
    
    
}

//
//  MlinkEventNetworkManager.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//
import UIKit

final class MlinkEventNetworkManager: IMlinkNetwork{
    typealias payloadType = MlinkEventPayload
    func baseRequest(with payload: MlinkEventPayload, en: String, ep: String) {
        
        guard Mlink.isInitialized else {
            print("Mlink: You need to initialize SDK first.")
            return
        }
        
        guard let url = configureURL(with: payload, en: en, ep: ep) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en).\(ep)")
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en).\(ep)")
                }
                return
            }
            
            guard Range(200...300).contains(response.statusCode) else {
                if Mlink.isLogEnabled {
                    print("Mlink: Error - \(en).\(ep)")
                }
                return
            }
            if Mlink.isLogEnabled {
                print("Mlink: Success - \(en).\(ep)")
            }
            
        }
        
        task.resume()
    }
    
     func configureURL(with payload: MlinkEventPayload, en: String, ep: String) -> URL? {
        
        let baseURL = BaseURL.eventPayLoad.baseURL
        
         let lineItemIds =  payload.lineItemIds?.map(String.init).joined(separator: ",") ?? "0"
        var queryItemDict: [URLConstants.PublisherEventConstants: String?] = [
            .version:  Mlink.version,
            .timeStamp: "\(Int64(Date.timeIntervalSinceReferenceDate))",
            .deviceId:  UIDevice.current.identifierForVendor?.uuidString,
            .anonId:  UUID().uuidString,
            .userId: String(payload.userId ?? 0),
            .language: "\(Locale.current.identifier)".replacingOccurrences(of: "_", with: "-"),
            .sessionId: configureSessionId,
            .eventName: en,
            .eventParameter: ep,
            .lineItemIds: lineItemIds,
            .application: "\(Mlink.app!)",
            .loyaltyCard: payload.loyaltyCard,
            .operatingSystem: "iOS"
            
        ]
        
        if let products = payload.products {
            let mappedProducts = products.map { product in
                "\(product.barcode ?? 0):\(product.quantity ?? 0):\(product.price ?? 0)"
            }
            let joinedProducts = mappedProducts.joined(separator: ";")
            queryItemDict[.productList] = "\(joinedProducts);"
        }
        
        if let categoryId = payload.categoryId {
            queryItemDict[.categoryId] = categoryId
        }
        
        if let keyword = payload.keyword {
            queryItemDict[.keyword] = keyword
        }
        
        if let transactionId = payload.transactionId {
            queryItemDict[.transactionId] = String(transactionId)
        }
        
        if let totalRowCount = payload.totalRowCount {
            queryItemDict[.totalRowCount] = String(totalRowCount)
        }
        let queryItems = queryItemDict.compactMap { key, value in
            value.map { URLQueryItem(name: key.rawValue, value: $0) }
        }
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.path = "/events"
        urlComponents?.queryItems = queryItems
                
        return urlComponents?.url
    }
}

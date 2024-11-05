

import UIKit

final class MlinkNetworkManager {
    
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
    
    private func configureURL(with payload: MlinkEventPayload, en: String, ep: String) -> URL? {
        
        let baseURL = "https://collector.avvamobiledemo.com/im.gif"
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "v", value: Mlink.version),
            URLQueryItem(name: "pub", value: Mlink.publisher),
            URLQueryItem(name: "t", value: "\(Int(Date.timeIntervalSinceReferenceDate))"),
            URLQueryItem(name: "d", value: UIDevice.current.identifierForVendor?.uuidString),
            URLQueryItem(name: "aid", value: String(payload.userId ?? 0)),
            URLQueryItem(name: "uid", value: String(payload.userId ?? 0)),
            URLQueryItem(name: "lng", value: "\(Locale.current.identifier)".replacingOccurrences(of: "_", with: "-")),
            URLQueryItem(name: "p", value: "apple-ios-\(UIDevice.current.systemVersion)"),
            URLQueryItem(name: "s", value: configureSessionId),
            URLQueryItem(name: "en", value: en),
            URLQueryItem(name: "ep", value: ep)
        ]
        
        if let products = payload.products {
            let mappedProducts = products.map { product in
                "\(product.barcode ?? 0):\(product.quantity ?? 0):\(product.price ?? 0)"
            }
            let joinedProducts = mappedProducts.joined(separator: ";")
            queryItems.append(URLQueryItem(name: "pl", value: "\(joinedProducts);"))
        }
        
        if let categoryId = payload.categoryId {
            queryItems.append(URLQueryItem(name: "ct", value: categoryId))
        }
        
        if let keyword = payload.keyword {
            queryItems.append(URLQueryItem(name: "kw", value: keyword))
        }
        
        if let transactionId = payload.transactionId {
            queryItems.append(URLQueryItem(name: "trans", value: String(transactionId)))
        }
        
        if let totalRowCount = payload.totalRowCount {
            queryItems.append(URLQueryItem(name: "trc", value: String(totalRowCount)))
        }
        
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = queryItems
                
        return urlComponents?.url
    }
    
    private func logger(input: some Equatable, isSuccess: Bool) {
        if Mlink.isLogEnabled {
            print("Mlink Event \(isSuccess ? "Success" : "Error"): \(input)")
        }
    }
    
    private var configureSessionId: String {
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

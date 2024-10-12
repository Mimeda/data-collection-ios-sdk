//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import UIKit

final class MlinkNetworkManager {
    
    func baseRequest(with payload: MlinkEventPayload, en: String, ep: String) {
        
        guard MlinkInitializer.isInitialized else {
            print("Mlink Event Error: You need to initialize SDK first.")
            return
        }
        
        guard let url = configureURL(with: payload, en: en, ep: ep) else {
            return
        }
        
        if MlinkInitializer.isLogEnabled {
            print("Mlink Request: \(url.absoluteString)")
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                self.logger(input: error.localizedDescription, isSuccess: false)
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                self.logger(input: "", isSuccess: false)
                return
            }
            
            guard Range(200...300).contains(response.statusCode) else {
                self.logger(input: response.statusCode, isSuccess: false)
                return
            }
            
            self.logger(input: response.statusCode, isSuccess: true)
        }
        
        task.resume()
    }
    
    private func configureURL(with payload: MlinkEventPayload, en: String, ep: String) -> URL? {
        
        let baseURL = "https://collector.avvamobiledemo.com/im.gif" //"https://s.mlink.com.tr/im.gif?"
        
        // Query parameters
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "v", value: MlinkInitializer.version),
            URLQueryItem(name: "pub", value: MlinkInitializer.publisher),
            URLQueryItem(name: "t", value: "\(Int(Date.timeIntervalSinceReferenceDate))"),
            URLQueryItem(name: "d", value: UIDevice.current.identifierForVendor?.uuidString),
            URLQueryItem(name: "aid", value: String(payload.userId ?? 0)),
            URLQueryItem(name: "uid", value: String(payload.userId ?? 0)),
            URLQueryItem(name: "lng", value: "\(Locale.current.identifier)".replacingOccurrences(of: "_", with: "-")),
            URLQueryItem(name: "p", value: "apple-ios-\(UIDevice.current.systemVersion)"),
            URLQueryItem(name: "s", value: "444"),
            URLQueryItem(name: "en", value: en),
            URLQueryItem(name: "ep", value: ep)
        ]
        
        // Add line items if available
        if let lineItems = payload.lineItems {
            let lineItemsString = lineItems.map { "\($0)" }.joined(separator: ",")
            queryItems.append(URLQueryItem(name: "li", value: lineItemsString))
        }
        
        // Add products if available
        if let products = payload.products {
            let mappedProducts = products.map { product in
                "\(product.barcode ?? 0):\(product.quantity ?? 0):\(product.price ?? 0)"
            }
            let joinedProducts = mappedProducts.joined(separator: ";")
            queryItems.append(URLQueryItem(name: "pl", value: "\(joinedProducts);"))
        }
        
        // Create the URL components
        var urlComponents = URLComponents(string: baseURL)
        urlComponents?.queryItems = queryItems
                
        // Return the full URL
        return urlComponents?.url
    }
    
    private func logger(input: some Equatable, isSuccess: Bool) {
        if MlinkInitializer.isLogEnabled {
            print("Mlink Event \(isSuccess ? "Success" : "Error"): \(input)")
        }
    }
    
}



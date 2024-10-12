// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class Mlink {
    
    static public func homeView(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "view")
    }
         
    static public func homeAddToCart(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "addtocart")
    }
    
    static public func listingView(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "view")
    }
    
    static public func listingAddToCart(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "addtocart")
    }
    
    static public func searchView(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "view")
    }
    
    static public func searchAddToCart(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "addtocart")
    }
    
    static public func productDetailsView(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "view")
    }

    static public func productDetailsAddToCart(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "addtocart")
    }
    
    static public func cartView(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "cart", ep: "view")
    }
    
    static public func purchaseSuccess(with payload: MlinkEventPayload) {
        MlinkNetworkManager().baseRequest(with: payload, en: "purchase", ep: "success")
    }
    
}

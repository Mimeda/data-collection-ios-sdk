// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation


public class MlinkEvents {
    
    public class Home {
        static public func view(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList else {
                print("Mlink: You Should Send User Id & Ad Id List")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "view")
        }
             
        static public func addToCart(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "addtocart")
        }
    }
    
    public class Listing {
        static public func view(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList else {
                print("Mlink: You Should Send User Id & Ad Id List")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "view")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "addtocart")
        }
    }
    
    public class Search {
        static public func view(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList else {
                print("Mlink: You Should Send User Id & Ad Id List")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "view")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "addtocart")
        }
    }
    
    public class ProductDetails {
        static public func view(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "view")
        }

        static public func addToCart(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "addtocart")
        }
    }
   
    public class Cart {
        static public func view(with payload: MlinkEventPayload) {
            guard let _ = payload.userId, let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "cart", ep: "view")
        }
    }
    
    public class Purchase {
        static public func success(with payload: MlinkEventPayload) {
            guard let _ = payload.userId,let _ = payload.adIDList, let _ = payload.products else {
                print("Mlink: You Should Send User Id & Ad Id List & Products")
                return
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "purchase", ep: "success")
        }
    }
    
}

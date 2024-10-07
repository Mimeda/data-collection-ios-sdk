// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public class Mlink {
    
    public class Event {
        
        public class Home {
            static public func viewEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
            
            static public func addToCart(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
        
        public class List {
            static public func viewEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
            
            static public func addToCart(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
        
        public class Search {
            static public func viewEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
            
            static public func addToCart(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
        
        public class ProductDetails {
            static public func viewEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
            
            static public func addToCart(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
        
        public class Cart {
            static public func viewEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
        
        public class Purchase {
            static public func successEvent(with payload: MlinkEventPayload) {
                MlinkNetworkManager().baseRequest(with: payload)
            }
        }
    }
}

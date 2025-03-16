
import Foundation

public class MlinkEvents {
    
    public class Home {
        static public func view(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Home", ep: "View")
        }
             
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Home", ep: "AddToCart")
        }
        
        static public func addToFavorites(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Home", ep: "AddToFavorites")
        }
    }
    
    public class Listing {
        static public func view(with payload: MlinkEventPayload) {
            if payload.categoryId == nil {
                print("Mlink: You Should Send CategoryId")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Listing", ep: "View")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            if payload.categoryId == nil {
                print("Mlink: You Should Send CategoryId")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Listing", ep: "AddToCart")
        }
        
        static public func addToFavorites(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Listing", ep: "AddToFavorites")
        }
    }
    
    public class Search {
        static public func view(with payload: MlinkEventPayload) {
            if payload.keyword == nil || payload.totalRowCount == nil {
                print("Mlink: You Should Send Keyword")
            }
            if payload.totalRowCount == nil {
                print("Mlink: You Should Send Total Row Count")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Search", ep: "View")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            if payload.keyword == nil {
                print("Mlink: You Should Send Keyword")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Search", ep: "AddToCart")
        }
        
        static public func addToFavorites(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Search", ep: "AddToFavorites")
        }
    }
    
    public class ProductDetails {
        static public func view(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "ProductDetails", ep: "View")
        }

        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "ProductDetails", ep: "AddToCart")
        }
        
        static public func addToFavorites(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "ProductDetails", ep: "AddToFavorites")
        }
    }
   
    public class Cart {
        static public func view(with payload: MlinkEventPayload) {
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Cart", ep: "View")
        }
    }
    
    public class Purchase {
        static public func success(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            if payload.transactionId == nil {
                print("Mlink: You Should Send Transaction Id")
            }
            MlinkEventNetworkManager().baseRequest(with: payload, en: "Purchase", ep: "Success")
        }
    }
    
}

public class MlinkAds {
    
    static public func impression(with payload: MlinkAdPayload) {
        MlinkAdNetworkManager().baseRequest(with: payload, en: "Ad Impression", state: .impression)
        }
             
    static public func click(with payload: MlinkAdPayload) {
        
        MlinkAdNetworkManager().baseRequest(with: payload, en: "Ad Click", state: .click)
        
    }
    
}

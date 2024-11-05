
import Foundation


public class MlinkEvents {
    
    public class Home {
        static public func view(with payload: MlinkEventPayload) {
            MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "view")
        }
             
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "home", ep: "addtocart")
        }
    }
    
    public class Listing {
        static public func view(with payload: MlinkEventPayload) {
            if payload.categoryId == nil {
                print("Mlink: You Should Send CategoryId")
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "view")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            if payload.categoryId == nil {
                print("Mlink: You Should Send CategoryId")
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "listing", ep: "addtocart")
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
            MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "view")
        }
        
        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            if payload.keyword == nil {
                print("Mlink: You Should Send Keyword")
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "search", ep: "addtocart")
        }
    }
    
    public class ProductDetails {
        static public func view(with payload: MlinkEventPayload) {
            MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "view")
        }

        static public func addToCart(with payload: MlinkEventPayload) {
            if payload.products == nil {
                print("Mlink: You Should Send Products")
            }
            MlinkNetworkManager().baseRequest(with: payload, en: "productdetails", ep: "addtocart")
        }
    }
   
    public class Cart {
        static public func view(with payload: MlinkEventPayload) {
            MlinkNetworkManager().baseRequest(with: payload, en: "cart", ep: "view")
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
            MlinkNetworkManager().baseRequest(with: payload, en: "purchase", ep: "success")
        }
    }
    
}

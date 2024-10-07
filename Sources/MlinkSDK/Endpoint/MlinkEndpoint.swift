//
//  File.swift
//  
//
//  Created by Sezgin Çiftci on 15.08.2024.
//

import Foundation

final class MlinkNetworkManager {
    
    func baseRequest(with payload: MlinkEventPayload) {
        
        let url =  URL(string: "")!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error {
                //TODO: Error Handling
                return
            }
            
            guard let response = response as? HTTPURLResponse, Range(200...300).contains(response.statusCode) else {
                //TODO: Error Handling
                return
            }
            
            if let data {
                print(String(data: data, encoding: .utf8)!)
            } else {
                //TODO: Error Handling
            }
        }
        
        task.resume()
    }
    
}



//
//  IMlinkNetwork.swift
//  MlinkSDK
//
//  Created by Erdem on 27.01.2025.
//
import Foundation

protocol IMlinkNetwork {
    associatedtype payloadType: ServiceModelProvidable
    func baseRequest(with payload: payloadType, en: String, ep: String, state: NetworkEventState?)
    func configureURL(with payload: payloadType, en: String, ep: String, state: NetworkEventState?) -> URL?
}
extension IMlinkNetwork {
    func baseRequest(with payload: payloadType, en: String, ep: String, state: NetworkEventState?) {}
    func configureURL(with payload: payloadType, en: String, ep: String, state: NetworkEventState?) -> URL? { return nil}
}

protocol ServiceModelProvidable {
    var userId: Int? {get set}
}


//
//  NetworkManager.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

protocol NetworkManager {
    func makeRequest(with requestData: RequestProtocol) async throws -> Data
}

class DefaultNetworkManager: NetworkManager {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func makeRequest(with requestData: RequestProtocol) async throws -> Data {
        let request = try requestData.configureRequest()
        
        do{
            let (data, _) = try await urlSession.data(for: request)
            return data
        }catch {
            throw error
        }
    }
}

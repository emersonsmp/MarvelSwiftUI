//
//  CharactersRequest.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

enum CharactersRequest: RequestProtocol {
    case getCharacters(offset: Int, searchKey: String?)
    
    var path: String {
        "/v1/public/characters"
    }
    
    var urlParams: [String : String?]{
        switch self {
            case .getCharacters(let offset, let searchKey):
                var params = ["offset": "\(offset)", "limit": "\(APIConstants.defaultLimit)"]
                if let searchKey {
                    params["nameStartsWith"] = searchKey
                }
                return params
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}

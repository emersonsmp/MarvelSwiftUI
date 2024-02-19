//
//  ComicsRequest.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

enum ComicsRequest: RequestProtocol {
    case getComicsByCharacterId(characterId: Int, offset: Int)
    
    var path: String{
        switch self {
            case .getComicsByCharacterId(let characterId, _):
                return "/v1/public/characters/\(characterId)/comics"
        }
    }
    
    var urlParams: [String: String?] {
        switch self {
        case .getComicsByCharacterId(_, let offset):
            return ["offset": "\(offset)",
                    "limit": "\(APIConstants.defaultLimit)"]
        }
    }
    
    var requestType: RequestType {
        .GET
    }
}

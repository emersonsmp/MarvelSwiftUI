//
//  BaseResponseModel.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

struct BaseResponseModel<T: Codable>: Codable {
    let code: Int
    let status: String
    let data: T
}

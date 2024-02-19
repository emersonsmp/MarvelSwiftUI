//
//  Error+AppError.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

extension Error {
    var toAppError: AppError {
        if self is NetworkError {
            return .networkError("errorWhileFetchingData")
        }
        return AppError.unknownError("unknownError")
    }
}

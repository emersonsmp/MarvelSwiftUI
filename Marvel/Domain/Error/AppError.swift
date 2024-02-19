//
//  AppError.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

enum AppError: Error, Equatable {
    case networkError(String)
    case parsingError(String)
    case serverError(String)
    case unknownError(String)
    case localDataFetchError(String)
}

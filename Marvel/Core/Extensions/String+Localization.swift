//
//  String+Localization.swift
//  Marvel
//
//  Created by Emerson Sampaio on 12/02/24.
//

import Foundation

extension String {
    func localized(with comment: String = "") -> String {
        return NSLocalizedString(self, comment: comment)
    }
}

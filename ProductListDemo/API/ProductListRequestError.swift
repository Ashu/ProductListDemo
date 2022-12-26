//
//  ProductListRequestError.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import Foundation

enum ProductListRequestError: Error {
    case invalidURLString
    case invalidURL
}

extension ProductListRequestError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .invalidURLString:
            return "Please provide a valid string"
        case .invalidURL:
            return "Please provide a valid URL"
        }
    }
}

extension ProductListRequestError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidURLString:
            return NSLocalizedString(
                "Please provide a valid string",
                comment: "Invalid string"
            )
        case .invalidURL:
            return NSLocalizedString(
                "Please provide a valid URL",
                comment: "Invalid URL"
            )
        }
    }
}

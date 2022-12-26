//
//  String+Validation.swift
//  ProductListDemo
//
//  Created by ashu on 26/12/22.
//

import UIKit

extension String {
    func isValidURL() -> Bool {
        let detector = try! NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        if let match = detector.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // it is a link, if the match covers the whole string
            return match.range.length == self.utf16.count
        }
        
        return false
    }
}

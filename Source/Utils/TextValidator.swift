//
//  TextValidator.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/14/22.
//

import Foundation

protocol TextValidatorProtocol {
    static func isValid(value: String) -> Bool
}

struct TextValidator: TextValidatorProtocol {
    static func isValid(value: String) -> Bool {
        if value != " "{
            return true
        }
        return false
    }
}

//
//  TextValidator.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/14/22.
//

import Foundation

protocol TextValidatorProtocol {
    func isValid(value: String) -> Bool
}

struct TextValidator: TextValidatorProtocol{
    func isValid(value: String) -> Bool {
        if value != " "{
            return true
        }
        return false
    }
}

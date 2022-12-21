//
//  PinBoxFactory.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/13/22.
//

import Foundation

public enum PinBoxType {
    case circle
    case square
    case underLine
    
    var instance: PinBoxViewProtocol {
        switch self {
        case .circle:
            return PinBoxCircleView()
        case .square:
            return PinBoxSquareView()
        case .underLine:
            return PinBoxViewUnderline()
        }
    }
}

struct PinBoxFactory {
    static func createPinBoxView(type: PinBoxType) -> PinBoxViewProtocol {
        type.instance
    }
}

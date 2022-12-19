//
//  PinBoxFactory.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/13/22.
//

import Foundation

public enum PinBoxType: String{
    case circle
    case square
    case underLine
}

struct PinBoxFactory {
    
    let availablePinBoxes : [PinBoxType: PinBoxViewProtocol.Type] = [.circle: PinBoxCircleView.self,.square: PinBoxSquareView.self]
    
    func createPinBoxView(type: PinBoxType) -> PinBoxViewProtocol?{
        guard let pinBox = availablePinBoxes[type] else {
            return nil
        }
        return pinBox.init()
    }
    
}

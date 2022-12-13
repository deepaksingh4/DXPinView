//
//  PinBoxFactory.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/13/22.
//

import Foundation

enum PinBoxType: String{
    case circle = "circle"
    case square = "square"
  
}

struct PinBoxFactory {
    
    let availablePinBoxes : [String: PinBoxViewProtocol.Type] = ["circle": PinBoxCircleView.self,"square": PinBoxSquareView.self]
    
    func createPinBoxView(type: String) -> PinBoxViewProtocol?{
        guard let pinBox = availablePinBoxes[type] else {
            return nil
        }
        return pinBox.init()
    }
    
}

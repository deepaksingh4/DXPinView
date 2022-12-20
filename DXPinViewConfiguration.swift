//
//  DXPinViewConfiguration.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/14/22.
//

import Foundation

public struct DXPinViewConfiguration {
    var count: Int
    var pinViewType: PinBoxType
    var pinBoxConfiguration: DXPinBoxConfiguration
    
   public init(count: Int = 4, pinViewType: PinBoxType = .square, pinBoxConfiguration: DXPinBoxConfiguration = DXPinBoxConfiguration()) {
        self.count = count
        self.pinViewType = pinViewType
        self.pinBoxConfiguration = pinBoxConfiguration
    }
}

public struct DXPinBoxConfiguration {
    var textFont: UIFont
    var pinViewBackground: PinBoxBackground
    var borderWidth: Float
    var showText: Bool
    var borderType: PinBoxBorder
    var textColor: UIColor
    
    public init(textFont: UIFont = .systemFont(ofSize: 18),
                pinViewBackground: PinBoxBackground = .fill(color: .white, opacity: 1),
                borderWidth: Float = 0.5,
                showText: Bool = true,
                borderType: PinBoxBorder = .solid(width: 0.5, color: .gray),
                textColor: UIColor = .blue) {
        self.textFont = textFont
        self.pinViewBackground = pinViewBackground
        self.borderWidth = borderWidth
        self.showText = showText
        self.borderType = borderType
        self.textColor = textColor
    }
}

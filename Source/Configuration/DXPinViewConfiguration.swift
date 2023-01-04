//
//  DXPinViewConfiguration.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/14/22.
//

import Foundation

/// Set border for the pin views you can set it
/// 1. solid(width: Float, color: UIColor): Set it to Solid with custom width and color of your choice
/// 2. dashed(width: Float, color: UIColor): Set it to dashed with custom width and color of your choice
/// 3. none: No border around the pin Boxes
public enum PinBoxBorder {
    case solid(width: Float, color: UIColor)
    case dashed(width: Float, color: UIColor)
    case none
}

/// Set background color with opavcity
/// fill(color: UIColor, opacity: Float)
/// or none(clear) at all
public enum PinBoxBackground {
    case fill(color: UIColor, opacity: Float)
    case none
}

/// Use this to setup the View with possible customization
public struct DXPinViewConfiguration {
    var count: Int
    var pinViewType: PinBoxType
    var pinBoxConfiguration: DXPinBoxConfiguration
    
    /// Initailzer for box configuration
    /// - Parameters:
    ///   - count: number of boxes/input you need. make sure you check for the device you will be targetting ;)
    ///   - pinViewType: what type of box view you want to use
    ///   - pinBoxConfiguration: Conifguration for the pin box View
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
    
    /// Confguration for PinBoxView to be used in PinView
    /// - Parameters:
    ///   - textFont: font you want to use
    ///   - pinViewBackground: background you want to use
    ///   - borderWidth: width of the border
    ///   - showText: show or hide text in the Pin Box
    ///   - borderType: type of border you want to set
    ///   - textColor: text color inside the pinView
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

//
//  BasePinView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/14/22.
//

import Foundation

class BasePinView: UIView, PinBoxViewProtocol {
    var valueLabel: UILabel = UILabel()
    
    var value: String = "" {
        didSet{
            valueLabel.text = configuration.showText ? value : "*"
        }
    }
    
}

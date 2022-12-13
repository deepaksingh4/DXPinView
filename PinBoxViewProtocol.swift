//
//  PinViewProtocol.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/12/22.
//

import Foundation

protocol PinBoxViewProtocol where Self: UIView {
    var border: PinBoxBorder {get set}
    var background: PinBoxBackground {get set}
    var valueLabel: UILabel {get set}
    var font: UIFont {get set}
    var value: String {get set}
    
    func updateUI()
    func drawLabel()
    init()
    
}

extension PinBoxViewProtocol{
    var border: PinBoxBorder {
        get{
            return PinBoxBorder.solid(width: 1)
        }
        set{
            
        }
    }
    var background: PinBoxBackground {
        get{
            return PinBoxBackground.fill(color: UIColor.gray, opacity: 1.0)
        }
        set{
        }
    }
    
    var font: UIFont {
        get{
            return UIFont.systemFont(ofSize: 30)
        }
        set{
            
        }
    }

    func drawLabel(){

        valueLabel = UILabel()
        valueLabel.center = self.center
        valueLabel.font = font
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.textColor = .white
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
        let widthConstraint = NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: valueLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraint(widthConstraint)
        self.addConstraint(heightConstraint)
        self.updateConstraints()
    }
}


enum PinBoxBorder {
    case solid(width: Int)
    case dashed(width: Int)
    case underLine
    case none
}

enum PinBoxBackground {
    case fill(color: UIColor, opacity: Float)
    case none
}



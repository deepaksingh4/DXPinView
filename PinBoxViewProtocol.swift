//
//  PinViewProtocol.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/12/22.
//

import Foundation

protocol PinBoxViewProtocol where Self: UIView {
    var valueLabel: UILabel {get set}
    var value: String {get set}
    var configuration: DXPinBoxConfiguration {get set}
    var deleteLast : Bool {get set}
    
    func updateUI()
    func drawLabel()
    init()
    
}

extension PinBoxViewProtocol{
    
    var configuration: DXPinBoxConfiguration  {
        get{
            return DXPinBoxConfiguration()
        }
        set{
            
        }
    }
    
    var deleteLast : Bool {
        get{
            return true
        }set{
            
        }
    }
    

    
    func drawLabel(){
        valueLabel = UILabel()
        valueLabel.center = self.center
        valueLabel.font = configuration.textFont
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.textColor = configuration.textColor
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
        let widthConstraint = NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: valueLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraint(widthConstraint)
        self.addConstraint(heightConstraint)
        let boxWidthConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        self.addConstraint(boxWidthConstraint)
        self.updateConstraints()
        self.setBorder(border: configuration.borderType, cornerRadius: self.frame.height/2)
        self.setBackground(background: configuration.pinViewBackground)
    }
    
    func updateUI() {
        
    }
}


public enum PinBoxBorder {
    case solid(width: Float, color: UIColor)
    case dashed(width: Float, color: UIColor)
    case underLine
    case none
}

public enum PinBoxBackground {
    case fill(color: UIColor, opacity: Float)
    case none
}



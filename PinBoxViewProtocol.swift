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
    var deleteLast: Bool {get set}
    
    func updateUI()
    func drawLabel()
    init()
}

extension PinBoxViewProtocol {
    var configuration: DXPinBoxConfiguration {
        get {
            return DXPinBoxConfiguration()
        }
    }

    var deleteLast: Bool {
        get {
            return true
        }
    }
    var valueLabel: UILabel {
        get{
            return UILabel()
        }
    }

    func drawLabel() {
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
        self.setBackground(background: configuration.pinViewBackground)
    }
}

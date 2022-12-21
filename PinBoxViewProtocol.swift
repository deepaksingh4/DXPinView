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
    var deleteLast : Bool {get set}
    
    func initUI()
    func updateUI()
    
    var configuration: DXPinBoxConfiguration { get set }
}

extension PinBoxViewProtocol {
    
    var deleteLast : Bool {
        get {
            return true
        }
    }
    
    func initUI(){
        valueLabel = UILabel()
        valueLabel.center = self.center
        valueLabel.font = configuration.textFont
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.textColor = configuration.textColor
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
        setupConstraints()
        self.setBackground(background: configuration.pinViewBackground)
    }
    
    private func setupConstraints() {
        let widthConstraint = NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: valueLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        self.addConstraint(widthConstraint)
        self.addConstraint(heightConstraint)
        let boxWidthConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        self.addConstraint(boxWidthConstraint)
        self.updateConstraints()
    }
}

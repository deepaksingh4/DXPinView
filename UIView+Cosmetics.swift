//
//  UIView+Cosmetics.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/14/22.
//

import Foundation

extension UIView {
    
    func setBorder(border: PinBoxBorder, cornerRadius: CGFloat){
        switch border{
        case .solid(let width, let color):
            self.layer.borderWidth = CGFloat(width)
            self.layer.borderColor = color.cgColor
            
        case .dashed(let width, let color):
            let borderView = CAShapeLayer()
            borderView.strokeColor = color.cgColor
            borderView.lineDashPattern = [10, 3]
            borderView.frame = self.bounds
            borderView.lineWidth = CGFloat(width)
            borderView.fillColor = UIColor.clear.cgColor
            borderView.path = UIBezierPath(roundedRect: self.bounds, cornerRadius:  cornerRadius).cgPath
            self.layer.addSublayer(borderView)
        case .none:
            print("No border")
        case .underLine:
            print("Later")
        }
    }
    
    func setBackground(background: PinBoxBackground){
        switch(background) {
        case .none:
            self.backgroundColor = .clear
        case .fill(let color, let opacity):
            self.backgroundColor = color
            self.layer.opacity = opacity
        }
    }
}

//
//  PinBoxCircleView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/12/22.
//

import Foundation

class PinBoxCircleView: UIView{
   
    var valueLabel: UILabel = UILabel()
    var value: String = "-*-" {
        didSet{
            valueLabel.text = configuration.showText ? value : "●"
        }
    }
    
    var deleteLast : Bool = false {
        didSet{
            valueLabel.text = ""
        }
    }
    
    var configuration: DXPinBoxConfiguration = DXPinBoxConfiguration() {
        didSet{
            self.drawLabel()
            updateUI()
            self.setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawLabel()
    }
    
    override func draw(_ rect: CGRect) {
        updateUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension PinBoxCircleView: PinBoxViewProtocol {
    func updateUI() {
        
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
        self.setBorder(border: configuration.borderType, cornerRadius: self.frame.height/2)
        self.setBackground(background: configuration.pinViewBackground)
    }
}

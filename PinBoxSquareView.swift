//
//  PinBoxSquareView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/12/22.
//

import Foundation

class PinBoxSquareView: UIView {
    
    
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


extension PinBoxSquareView: PinBoxViewProtocol{
    
   func updateUI() {
        self.addSubview(valueLabel)
        self.layer.cornerRadius = 0
        self.clipsToBounds = true
        self.setBackground(background: configuration.pinViewBackground)
        self.setBorder(border: configuration.borderType, cornerRadius: 0)
    }
    

}

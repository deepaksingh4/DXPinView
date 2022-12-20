//
//  PinBoxViewUnderline.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/13/22.
//

import Foundation

class PinBoxViewUnderline: UIView{
   
    var valueLabel: UILabel = UILabel()
    var value: String = "" {
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

extension PinBoxViewUnderline: PinBoxViewProtocol {
    func updateUI() {
        
        let lineView = UIView()
        lineView.frame = CGRect(x: 0, y: self.bounds.height - 2, width: self.bounds.width, height: 2)
        lineView.backgroundColor = .gray
        self.addSubview(lineView)
        self.setBackground(background: configuration.pinViewBackground)
        
    }
}

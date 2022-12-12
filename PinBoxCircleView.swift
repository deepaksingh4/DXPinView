//
//  PinBoxCircleView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/12/22.
//

import Foundation

class PinBoxCircleView: UIView{
   
    var valueLabel: UILabel = UILabel()
    var value: String = "A" {
        didSet{
            valueLabel.text = value
        }
    }
    
    var background: PinBoxBackground = .none {
        didSet{
            switch(background){
            case .none:
                self.backgroundColor = .clear
            case .fill(let color, let opacity):
                self.backgroundColor = color
                self.layer.opacity = opacity
            }
        }
    }
    var border: PinBoxBorder = .solid(width: 1) {
        didSet{
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor.gray.cgColor
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
    }
}

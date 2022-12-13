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
            switch border{
            case .solid(let width):
                self.layer.borderWidth = CGFloat(width)
                self.layer.borderColor = UIColor.gray.cgColor
                
            case .dashed(let width):
                let borderView = CAShapeLayer()
                borderView.strokeColor = UIColor.clear.cgColor
                borderView.lineDashPattern = [1, 1]
                borderView.frame = self.bounds
                borderView.fillColor = nil
                borderView.lineWidth = 1
                borderView.path = UIBezierPath(rect: self.bounds).cgPath
                self.layer.borderWidth = CGFloat(1)
                self.layer.addSublayer(borderView)
                self.layer.borderColor = UIColor.red.cgColor
                
            case .none:
                print("No border")
            case .underLine:
                print("Later")
            }
            
            
            
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

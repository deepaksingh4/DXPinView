//
//  PinBoxView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/8/22.
//

import Foundation


class PinBoxView: UIView{
    
    var value: String = "A" {
        didSet{
            valueLabel.text = value
        }
    }
    var valueLabel : UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup(){
        valueLabel = UILabel()
        valueLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        valueLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        valueLabel.center = self.center
        valueLabel.font = UIFont.systemFont(ofSize: 12)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.textColor = .white
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
        self.layer.cornerRadius = 10
    }
}

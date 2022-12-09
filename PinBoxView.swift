//
//  PinBoxView.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/8/22.
//

import Foundation

internal class PinBoxView: UIView{
    
    var value: String = "A" {
        didSet{
            valueLabel.text = value
        }
    }
    var cornerRadius: CGFloat = 10.0
    var valueLabel : UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        setupView()
        setUpLabel()
    }
    
    private func setupView(){
        self.layer.cornerRadius = cornerRadius
    }
    
    private func setUpLabel(){
        valueLabel = UILabel()
        let widthConstraint = NSLayoutConstraint(item: valueLabel, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 1)
        let heightConstraint = NSLayoutConstraint(item: valueLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 1)
        self.addConstraint(widthConstraint)
        self.addConstraint(heightConstraint)
        valueLabel.center = self.center
        valueLabel.font = UIFont.systemFont(ofSize: 30)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.textAlignment = .center
        valueLabel.textColor = .white
        valueLabel.clipsToBounds = true
        self.addSubview(valueLabel)
    }
}

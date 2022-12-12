
@IBDesignable
public class DXPinView: UIView {
    
    lazy var values: [String] = []
    var pinBoxes : [PinBoxViewProtocol] = []
    var pinBoxStack : UIStackView = UIStackView()
    
    
    @IBInspectable var count: Int = 4 {
        didSet{
            cleanStackView()
            setup()
        }
    }
    
    @IBInspectable var textFont: UIFont = UIFont.systemFont(ofSize: 12)
    @IBInspectable var backGroundColor: UIColor = UIColor.gray
    
    public override var canBecomeFirstResponder: Bool{
        return true
    }
    
    func setup(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
        pinBoxStack.alignment = .fill
        pinBoxStack.distribution = .equalSpacing
        
        self.addSubview(pinBoxStack)
       

        let totalBoxWdith = self.frame.height * CGFloat(count)
        print("totalBoxWdith \(totalBoxWdith) : \(self.frame.width)")
        print("total Spacing \((self.frame.width - totalBoxWdith))")
        print("Individual Spacing \(((self.frame.width - totalBoxWdith) /  CGFloat(count-1)))")
        pinBoxStack.spacing = ((self.frame.width - totalBoxWdith) /  CGFloat(count - 1))
        pinBoxStack.axis = .horizontal
        pinBoxStack.translatesAutoresizingMaskIntoConstraints = false
        
        let centerConstraintX = NSLayoutConstraint(item: pinBoxStack, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerConstraintY = NSLayoutConstraint(item: pinBoxStack, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: pinBoxStack, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: pinBoxStack, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        
        self.addConstraints([centerConstraintX, centerConstraintY, heightConstraint, widthConstraint])
        self.updateConstraints()
        
        for _ in 0..<count{
            let pinBox = PinBoxCircleView()
            pinBox.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
            let widthConstraint = NSLayoutConstraint(item: pinBox, attribute: .height, relatedBy: .equal, toItem: pinBox, attribute: .width, multiplier: 1, constant: 1)
            pinBox.addConstraint(widthConstraint)
            pinBox.border = .solid(width: 1)
            pinBox.font = textFont
            pinBox.background = .fill(color: backGroundColor, opacity: 0.8)
            self.pinBoxes.append(pinBox)
            self.pinBoxStack.addArrangedSubview(pinBox)
        }
       
    }
    
    func cleanStackView(){
        if pinBoxes.count > 0 {
            for box in 0..<pinBoxes.count{
                let pinBoxView = pinBoxes[box]
                pinBoxStack.removeArrangedSubview(pinBoxView)
            }
            pinBoxes.removeAll()
        }
        return
        
    }
}



extension DXPinView: UIKeyInput {
    
    public var hasText: Bool {
        return values.count > 0
    }
    
    public func insertText(_ text: String) {
        if values.count == count {
            self.resignFirstResponder()
            return
        }
        let pinBox = pinBoxes[values.count]
        pinBox.value = text
        
        values.append(text)
        
        print(values)
    }
    
    public func deleteBackward() {
        if values.count > 0{
            values.removeLast()
            let pinBox = pinBoxes[values.count]
            pinBox.value = ""
        }
    }
    
    @objc(showKeyboard)
    func showKeyboard(){
        self.becomeFirstResponder()
    }
}

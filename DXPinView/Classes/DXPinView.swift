
@IBDesignable
public class DXPinView: UIView {
    
    
    var values: [String] = []
    var pinBoxes : [PinBoxView] = []
    var pinBoxStack : UIStackView = UIStackView()
    
    var count: Int = 4
    public override var canBecomeFirstResponder: Bool{
        return true
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
        
        pinBoxStack.frame = self.frame
        pinBoxStack.leadingAnchor.anchorWithOffset(to: self.leadingAnchor)
        pinBoxStack.trailingAnchor.anchorWithOffset(to: self.trailingAnchor)
        pinBoxStack.topAnchor.anchorWithOffset(to: self.topAnchor)
        pinBoxStack.alignment = .fill
        pinBoxStack.distribution = .fillEqually
        pinBoxStack.axis = .horizontal
        pinBoxStack.spacing = 5
        pinBoxStack.translatesAutoresizingMaskIntoConstraints = false
        
        
        for _ in 0..<count{
            let pinBox = PinBoxView()
            pinBox.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
            pinBox.widthAnchor.constraint(equalToConstant: self.frame.width/CGFloat(count)).isActive = true
            pinBox.backgroundColor = .gray
            self.pinBoxes.append(pinBox)
            self.pinBoxStack.addArrangedSubview(pinBox)
        }
        
        self.addSubview(pinBoxStack)
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
        print("Delete pressed")
    }
    
    @objc(showKeyboard)
    func showKeyboard(){
        self.becomeFirstResponder()
    }
}

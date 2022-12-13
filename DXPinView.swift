
@IBDesignable
public class DXPinView: UIView {
    
    lazy var values: [String] = []
    var pinBoxes : [PinBoxViewProtocol] = []
    var pinBoxStack : UIStackView = UIStackView()
    
    @IBInspectable var textFont: UIFont = UIFont.systemFont(ofSize: 12)
    @IBInspectable var backGroundColor: UIColor = UIColor.gray
    @IBInspectable var pinBoxType : String = "square" {
        didSet{
            cleanStackView()
            setUpUI()
        }
    }
    @IBInspectable var count: Int = 4
    
    
    
    
    public override var canBecomeFirstResponder: Bool{
        return true
    }
    
    func setUpUI(){
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
        setupStackView()
    }
    
   
}


extension DXPinView {
    
  private func cleanStackView(){
        if pinBoxes.count > 0 {
            for box in 0..<pinBoxes.count{
                let pinBoxView = pinBoxes[box]
                pinBoxStack.removeArrangedSubview(pinBoxView)
            }
            pinBoxes.removeAll()
        }
        return
        
    }
    
    private func setupStackView(){
        pinBoxStack.alignment = .fill
        pinBoxStack.distribution = .equalSpacing
        pinBoxStack.axis = .horizontal
        pinBoxStack.alignment = .center
        pinBoxStack.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(pinBoxStack)
        
//        Adding constraint for positioning stack view in the main view
        let centerConstraintX = NSLayoutConstraint(item: pinBoxStack, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let centerConstraintY = NSLayoutConstraint(item: pinBoxStack, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0)
        let heightConstraint = NSLayoutConstraint(item: pinBoxStack, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: pinBoxStack, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0)
        self.addConstraints([centerConstraintX, centerConstraintY, heightConstraint, widthConstraint])
        self.updateConstraints()
//        Add all the pinViews in StackView
        addPinBoxViews()
    }
    
    private func addPinBoxViews(){
        
        let spacer = UIView()
        self.pinBoxStack.addArrangedSubview(spacer)
        for _ in 0..<count{
                 
            guard let selectedPinBox = PinBoxType(rawValue: pinBoxType) else{
                print("wrong box type")
                return
            }
            guard let pinBox = PinBoxFactory().createPinBoxView(type: selectedPinBox.rawValue) else{
                return
            }
            pinBox.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
            let widthConstraint = NSLayoutConstraint(item: pinBox, attribute: .height, relatedBy: .equal, toItem: pinBox, attribute: .width, multiplier: 1, constant: 0)
            pinBox.addConstraint(widthConstraint)
            pinBox.border = .dashed(width: 1)
            pinBox.font = textFont
            pinBox.background = .fill(color: backGroundColor, opacity: 1)
            self.pinBoxes.append(pinBox)
            self.pinBoxStack.addArrangedSubview(pinBox)
        }
        
        let spacer2 = UIView()
        self.pinBoxStack.addArrangedSubview(spacer2)
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

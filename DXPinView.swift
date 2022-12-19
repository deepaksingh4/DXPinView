//
//  DXPinView.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/12/22.
//

public class DXPinView: UIView {
    
    lazy var values: [String] = []
    var enteredPin : String {
        get{
            return values.joined()
        }
    }
    var pinBoxes : [PinBoxViewProtocol] = []
    var pinBoxStack : UIStackView = UIStackView()
    private var viewConfiguration: DXPinViewConfiguration = DXPinViewConfiguration(){
        didSet{
                self.cleanStackView()
                self.setUpUI()
        }
    }
    
    public override var canBecomeFirstResponder: Bool{
        return true
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.viewConfiguration = DXPinViewConfiguration()
    }
    
    public func updateConfiguration(config: DXPinViewConfiguration){
        self.viewConfiguration = config
    }
    public func getConfiguration() -> DXPinViewConfiguration{
        return viewConfiguration
    }
}


extension DXPinView {
    
    func setUpUI(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
        setupStackView()
    }
    
    private func cleanStackView(){
        if !pinBoxes.isEmpty {
            for box in pinBoxStack.arrangedSubviews{
                pinBoxStack.removeArrangedSubview(box)
                box.removeFromSuperview()
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
        for _ in 0..<viewConfiguration.count{
            guard let pinBox = PinBoxFactory().createPinBoxView(type: viewConfiguration.pinViewType) else{
                return
            }
            pinBox.heightAnchor.constraint(equalToConstant: self.frame.height).isActive = true
            pinBox.configuration = viewConfiguration.pinBoxConfiguration
            self.pinBoxes.append(pinBox)
            self.pinBoxStack.addArrangedSubview(pinBox)
        }
        let spacer2 = UIView()
        self.pinBoxStack.addArrangedSubview(spacer2)
        self.setNeedsDisplay()
    }
}


extension DXPinView: UIKeyInput {
    
    public var hasText: Bool {
        return values.isEmpty
    }
    
    public func insertText(_ text: String) {
        if text == "\n"{
            self.resignFirstResponder()
            return
        }
        if values.count == viewConfiguration.count {
            self.resignFirstResponder()
            return
        }
        if TextValidator().isValid(value: text){
            let pinBox = pinBoxes[values.count]
            pinBox.value = text
            values.append(text)
        }
        
        print(values)
    }
    
    public func deleteBackward() {
        if !values.isEmpty{
            values.removeLast()
            let pinBox = pinBoxes[values.count]
            pinBox.deleteLast = true
        }
    }
    
    
    
    @objc(showKeyboard)
    func showKeyboard(){
        self.becomeFirstResponder()
    }
}

//
//  DXPinView.swift
//  DXPinView
//
//  Created by Deepak Singh on 12/12/22.
//

import UIKit
public class DXPinView: UIView {

    private lazy var values: [String] = []
    public var enteredPin: String {
        get {
            return values.joined()
        }
    }
    private var pinBoxes: [PinBoxViewProtocol] = []
    private var pinBoxStack: UIStackView = UIStackView()
    public var viewConfiguration: DXPinViewConfiguration = DXPinViewConfiguration() {
        didSet {
            cleanStackView()
            addPinBoxViews()
        }
    }

    public override var canBecomeFirstResponder: Bool {
        return true
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpUI()
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
}

extension DXPinView {
    private func setUpUI() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showKeyboard))
        self.addGestureRecognizer(tapGesture)
        setupStackView()
    }

    private func setupStackView() {
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
    }
}

extension DXPinView {
    private func cleanStackView() {
        if !pinBoxes.isEmpty {
            for box in pinBoxStack.arrangedSubviews {
                pinBoxStack.removeArrangedSubview(box)
                box.removeFromSuperview()
            }
            pinBoxes.removeAll()
            values.removeAll()
        }
        return
    }

    private func addPinBoxViews() {
        let spacer = UIView()
        self.pinBoxStack.addArrangedSubview(spacer)
        for _ in 0..<viewConfiguration.count {
            let pinBox = PinBoxFactory.createPinBoxView(type: viewConfiguration.pinViewType)
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
        guard text != "\n",
              values.count != viewConfiguration.count,
              TextValidator.isValid(value: text) else {
            self.resignFirstResponder()
            return
        }

        let pinBox = pinBoxes[values.count]
        pinBox.value = text
        values.append(text)
    }

    public func deleteBackward() {
        guard !values.isEmpty else {
            return
        }

        values.removeLast()
        let pinBox = pinBoxes[values.count]
        pinBox.deleteLast = true
    }

    @objc func showKeyboard() {
        self.becomeFirstResponder()
    }
}

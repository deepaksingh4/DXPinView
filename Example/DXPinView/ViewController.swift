//
//  ViewController.swift
//  DXPinView
//
//  Created by Depak on 12/08/2022.
//  Copyright (c) 2022 Depak. All rights reserved.
//

import UIKit
import DXPinView

class ViewController: UIViewController {
    
    @IBOutlet weak var pinView: DXPinView!
//    @IBOutlet weak var updateBackground: UIColorWell!
    
    var pinViewType: PinBoxType = .circle
    var pinBackground: PinBoxBackground = .fill(color: .white, opacity: 1)
    var pinBorder: PinBoxBorder = .solid(width: 2, color: .gray)
    var showText: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), showText: false, borderType: .dashed(width: 0.5, color: .black), textColor: .gray)
        let config = DXPinViewConfiguration(count: 5, pinViewType: .circle, pinBoxConfiguration: boxConfig)
        self.pinView.updateConfiguration(config: config)
        
//        updateBackground.addTarget(self, action: #selector(colorChanged), for: .valueChanged)
        
    }
    
    @IBAction func changePinViewType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            pinViewType = .circle
        case 1:
            pinViewType = .square
        default:
            pinViewType = .square
        }
        self.updateConfiguration()
    }
    
    
    @IBAction func handleShowText(_ sender: UISwitch) {
        showText = sender.isOn
        self.updateConfiguration()
    }
    
    @IBAction func changeBorder(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            pinBorder = .solid(width: 1, color: .gray)
        case 1:
            pinBorder = .dashed(width: 2, color: .red)
        default:
            pinBorder = .solid(width: 1, color: .gray)
        }
        self.updateConfiguration()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController{
    
    func updateConfiguration(){
        let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), pinViewBackground: pinBackground, showText: showText, borderType: pinBorder, textColor: .gray)
        let config = DXPinViewConfiguration(count: 5, pinViewType: pinViewType, pinBoxConfiguration: boxConfig)
        self.pinView.updateConfiguration(config: config)
    }
    
    @objc func colorChanged(){
//        pinBackground = .fill(color: updateBackground.selectedColor ?? .white, opacity: Float(updateBackground.alpha))
//        self.updateConfiguration()
    }
}




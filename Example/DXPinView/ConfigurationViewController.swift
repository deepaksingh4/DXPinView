//
//  ConfigurationViewController.swift
//  DXPinView_Example
//
//  Created by Deepak Singh07 on 12/19/22.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import Foundation
import UIKit
import DXPinView

class ConfigurationViewController: UIViewController{
    
    @IBOutlet weak var borderWidth: UISlider!
    @IBOutlet weak var borderType: UISegmentedControl!
    @IBOutlet weak var showTextSwitch: UISwitch!
    @IBOutlet weak var backgroundPicker: UIColorWell!
    @IBOutlet weak var boxShape: UISegmentedControl!
    
    @IBOutlet weak var textColorWheel: UIColorWell!
    var confifguration: DXPinViewConfiguration = DXPinViewConfiguration()
    
    private var pinViewType: PinBoxType = .circle
    private var pinBackground: PinBoxBackground = .fill(color: .white, opacity: 1)
    private var pinBorder: PinBoxBorder = .solid(width: 2, color: .gray)
    private var showText: Bool = true
    
    override func viewDidLoad() {
        isModalInPresentation = true
    }
    
    @IBAction func changePinBoxShape(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            pinViewType = .circle
        case 1:
            pinViewType = .square
        default:
            pinViewType = .square
        }
    }
    
    @IBAction func changeBorderType(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            pinBorder = .solid(width: 1, color: .gray)
        case 1:
            pinBorder = .dashed(width: 2, color: .red)
        default:
            pinBorder = .solid(width: 1, color: .gray)
        }
    }
    
    
    
    @IBAction func updateConfiguratiuon(_ sender: Any) {
        guard let presentationController = self.presentingViewController else {
            return
        }
        
        guard let presentationController  = presentationController as? ConfiguurationUpdater else{
            return
        }
        self.dismiss(animated: true){
            presentationController.updateConfiguration(config: self.prepareConfiguration())
        }
    }
    
    func prepareConfiguration() -> DXPinViewConfiguration{
        let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), pinViewBackground: .fill(color: backgroundPicker.selectedColor ?? .white, opacity: Float(backgroundPicker.alpha)), showText: self.showText, borderType: self.pinBorder, textColor: textColorWheel.selectedColor ?? .darkText)
        let config = DXPinViewConfiguration(count: 5, pinViewType: pinViewType, pinBoxConfiguration: boxConfig)
        return config
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //        preparing configuration
        
        
        
        
    }
    
}

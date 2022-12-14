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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), showText: false, borderType: .dashed(width: 0.5, color: .black), textColor: .gray)
        let config = DXPinViewConfiguration(count: 5, pinViewType: .circle, pinBoxConfiguration: boxConfig)
        self.pinView.updateConfiguration(config: config)
    }

    @IBAction func changePinViewType(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), showText: false, borderType: .dashed(width: 0.5, color: .black), textColor: .gray)
            let config = DXPinViewConfiguration(count: 5, pinViewType: .circle, pinBoxConfiguration: boxConfig)
            self.pinView.updateConfiguration(config: config)
        }else{
            let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), showText: false, borderType: .dashed(width: 0.5, color: .black), textColor: .gray)
                   let config = DXPinViewConfiguration(count: 5, pinViewType: .square, pinBoxConfiguration: boxConfig)
                   self.pinView.updateConfiguration(config: config)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


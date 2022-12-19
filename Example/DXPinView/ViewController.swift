//
//  ViewController.swift
//  DXPinView
//
//  Created by Depak on 12/08/2022.
//  Copyright (c) 2022 Depak. All rights reserved.
//

import UIKit
import DXPinView

protocol ConfiguurationUpdater{
    func updateConfiguration(config: DXPinViewConfiguration)
}

class ViewController: UIViewController {
    
    @IBOutlet weak var pinView: DXPinView!
//    @IBOutlet weak var updateBackground: UIColorWell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let boxConfig = DXPinBoxConfiguration(textFont: .systemFont(ofSize: 25), showText: false, borderType: .dashed(width: 0.5, color: .black), textColor: .gray)
        let config = DXPinViewConfiguration(count: 5, pinViewType: .circle, pinBoxConfiguration: boxConfig)
        self.pinView.updateConfiguration(config: config)
    
    }
    
    
    @IBAction func handleShowText(_ sender: UISwitch) {
       
    }
    
    @IBAction func changeBorder(_ sender: UISegmentedControl) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: ConfiguurationUpdater{
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showConfig"{
            guard let configVC = segue.destination as? ConfigurationViewController else{
                return
            }
            configVC.confifguration = self.pinView.getConfiguration()
        }
    }
    
    
    func updateConfiguration(config: DXPinViewConfiguration){
        self.pinView.updateConfiguration(config: config)
    }
}




//
//  BoxConfiguration.swift
//  DXPinView
//
//  Created by Deepak Singh07 on 12/9/22.
//

import Foundation

protocol BoxConfiguration {
    var cornerRadius : CGFloat {get}
    var font: UIFont {get}
    var backGroundColor: UIColor {get}
}


extension BoxConfiguration{
    var cornerRadius : CGFloat {
            return 10
    }
    var font: UIFont {
        return UIFont.systemFont(ofSize: 12)
    }
    var backGroundColor: UIColor {
        return UIColor.gray
    }
    
}

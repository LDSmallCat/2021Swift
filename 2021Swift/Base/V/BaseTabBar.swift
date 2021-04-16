//
//  BaseTabBar.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class BaseTabBar: UITabBar {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.white
        //isTranslucent = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for button in subviews where button is UIControl {
            var frame = button.frame
            frame.origin.y = 7
            button.frame = frame
            
        }
    }

    deinit {
        debugPrint(self.className + "销毁")
    }
}

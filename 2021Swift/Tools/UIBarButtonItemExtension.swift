//
//  UIBarButtonItemExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

extension UIBarButtonItem {
    convenience init(norImage: String, selImage: String, imageEdgeInsets: UIEdgeInsets = .zero, target: Any?, action: Selector) {
        
        let button = UIButton(type: .custom)
        
        let norImg = UIImage.init(named: norImage)?.withRenderingMode(.alwaysOriginal)
        let selImg = UIImage.init(named: selImage)?.withRenderingMode(.alwaysOriginal)
        
        button.setImage(norImg, for: .normal)
        button.setImage(selImg, for: .selected)
        button.imageEdgeInsets = imageEdgeInsets
        
        button.addTarget(target, action: action, for: .touchUpInside)
        button.sizeToFit()
        
        if button.bounds.width < 44 || button.bounds.height > 44 {
            let width = 44 / button.bounds.height * button.bounds.width
            button.bounds = CGRect(x: 0, y: 0, width: width, height: 44)
        }
        self.init(customView: button)
    }
}

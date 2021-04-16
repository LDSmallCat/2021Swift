//
//  NSObjectExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/16.
//

extension NSObject {
    var className: String {
        let name = type(of: self).description()
        if name.contains(".") {
            return name.components(separatedBy: ".").last ?? name
        }else {
            return name
        }
        
    }
    
}

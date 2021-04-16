//
//  DeviceExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/9.
//

extension UIDevice {
    ///设备信息
    class var info: String {
        UIDevice.current.name + UIDevice.current.systemVersion + UIDevice.current.model
    }
    
    
}

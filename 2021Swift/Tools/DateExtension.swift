//
//  DateExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/2.
//

extension Date {
    /// 获取当前 秒级 时间戳 - 10位
    static var time10: String {
        return "\(Int(self.init().timeIntervalSince1970))"
    }
    
    /// 获取当前 毫秒级 时间戳 - 13位
    static var time13: String {
        return "\(Int(self.init().timeIntervalSince1970 * 1000))"
    }
}

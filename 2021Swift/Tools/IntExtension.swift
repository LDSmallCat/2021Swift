//
//  IntExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/5.
//

import Foundation

extension Int{
    static func random(maxInt: Int) -> Int {
        return Int(arc4random()) % maxInt
    }
}

//
//  LD.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/15.
//

public struct LD<Base> {
    let base: Base
    init(_ base: Base) {
        self.base = base
    }
}

// MARK: - protocol for normal types
public protocol LDCompatible {}
public extension LDCompatible {
    static var ld: LD<Self>.Type {
        get { return LD<Self>.self }
        set {}
    }
    var ld: LD<Self> {
        get { return LD(self) }
        set {}
    }
}

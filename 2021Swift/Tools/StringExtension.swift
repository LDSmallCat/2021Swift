//
//  StringExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/2.
//
import CommonCrypto

//MARK: - 字符串编码格式转换
//extension String {
//    var utf8Data: Data {
//        guard let data = self.data(using: .utf8) else {
//            return Data()
//        }
//        return data
//    }
//    var utf8String: String {
//        guard let s = String(cString: self, encoding: .utf8) else { return "" }
//        return s
//    }
//
//    var base64Data: Data {
//        guard let data = Data(base64Encoded: self, options: .ignoreUnknownCharacters) else {
//            return Data()
//        }
//        return data
//    }
//
//    var to64String: String {
//
//        self.utf8Data.base64EncodedString(options: .lineLength64Characters)
//    }
//
//
//
//}


//MARK: - 字符串加密
extension String {
    
}
//MARK: - 字符串截取
extension String {
    /// 根据下标获取某个下标字符
    subscript(index : Int) -> String {
        if index < 0 || index >= self.count{
            return ""
        }
        for (i,item) in self.enumerated(){
            if index == i {
                return "\(item)"
            }
        }
        return ""
    }
    
    /// 截取字符串
    /// - Parameters:
    ///   - begin: 开始截取的索引
    ///   - count: 需要截取的个数
    /// - Returns: 字符串
    func substring(start: Int = 0, _ length: Int = 0) -> String {
        
        let begin = index(startIndex, offsetBy: max(0, start))
        
        let end = index(startIndex, offsetBy: min(length, start + length))
        
        return String(self[begin..<end])
    }
    
}
//MARK: - MD5
extension String {
    
    var ld_md5:String {
        let utf8 = cString(using: .utf8)
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        CC_MD5(utf8, CC_LONG(utf8!.count - 1), &digest)
        return digest.reduce("") { $0 + String(format:"%02X", $1) }
    }

}

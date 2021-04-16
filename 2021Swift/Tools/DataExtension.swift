//
//  DataExtension.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/6.
//
import CommonCrypto

//extension Data {
//
//    /// 加密方式
//    enum EncryptType {
//        case aes128
//        case aes192
//        case aes256
//        case des
//        case des3//(3DES)
//    }
//
//    /// 加密
//    /// - Parameters:
//    ///   - key: key
//    ///   - iv: iv
//    ///   - type: 加密方式 EncryptType
//    ///   - options: 补码方式(PKCS7Padding/None)和加密模式(CBC/ECB，默认CBC)
//    /// - Returns: 加密后的Data
//    func encrypt(key: String,iv: String,type: EncryptType = .aes128,options: CCOptions = CCOptions(kCCOptionPKCS7Padding)) -> Data? {
//        return self.encrpt(key: key, iv: iv, operation: CCOperation(kCCEncrypt), type: type, options: options)
//
//    }
//
//
//    /// 解密
//    /// - Parameters:
//    ///   - key: key
//    ///   - iv: iv
//    ///   - type: 解密方式 EncryptType
//    ///   - options: 补码方式(PKCS7Padding/None)和解密模式(CBC/ECB，默认CBC)
//    /// - Returns: 解密后的Data
//    func decrypt(key: String,iv: String,type: EncryptType = .aes128,options: CCOptions = CCOptions(kCCOptionPKCS7Padding)) -> Data? {
//        return self.encrpt(key: key, iv: iv, operation: CCOperation(kCCDecrypt), type: type, options: options)
//
//    }
//
//
//    fileprivate func encrpt(key: String,iv: String,operation: CCOperation, type: EncryptType,options: CCOptions) -> Data? {
//        var keySize: Int = kCCKeySizeAES128
//        var algorithm: Int = kCCAlgorithmAES128
//        var blockSize: Int = kCCBlockSizeAES128
//
//        switch type {
//            case .aes128:
//                keySize = kCCKeySizeAES128
//                algorithm = kCCAlgorithmAES128
//                blockSize = kCCBlockSizeAES128
//
//            case .aes192:
//                keySize = kCCKeySizeAES192
//                algorithm = kCCAlgorithmAES128
//                blockSize = kCCBlockSizeAES128
//
//            case .aes256:
//                keySize = kCCKeySizeAES256
//                algorithm = kCCAlgorithmAES128
//                blockSize = kCCBlockSizeAES128
//
//            case .des:
//                keySize = kCCKeySizeDES
//                algorithm = kCCAlgorithmDES
//                blockSize = kCCBlockSizeDES
//
//            case .des3:
//                keySize = kCCKeySize3DES
//                algorithm = kCCAlgorithm3DES
//                blockSize = kCCBlockSize3DES
//
//
//    }
//
//        let keyLength = Swift.max(keySize, key.count)
//        var keyPtr = [Int8](repeating: 0, count: keyLength + 1)
//        bzero(&keyPtr, MemoryLayout.size(ofValue: keyPtr))
//        _ = key.getCString(&keyPtr, maxLength: MemoryLayout.size(ofValue: keyPtr), encoding: .utf8)
//        let dataLenght = self.count
//
//        let bufferSize = dataLenght + blockSize
//        let buffer = malloc(bufferSize)
//        var numBytesDecrypted = 0;
//
//        var ivPtr = [Int8](repeating: 0, count: blockSize + 1)
//        memset(&ivPtr, 0, MemoryLayout.size(ofValue: ivPtr))
//        _ = iv.getCString(&ivPtr, maxLength: MemoryLayout.size(ofValue: ivPtr), encoding: .utf8)
//
//        let cryptStatus = CCCrypt(operation, CCAlgorithm(algorithm), options, keyPtr, keySize, ivPtr, (self as NSData).bytes, dataLenght, buffer, bufferSize, &numBytesDecrypted)
//        if cryptStatus == kCCSuccess {
//            guard let buffer = buffer else { return nil }
//
//            return NSData.init(bytesNoCopy: buffer, length: numBytesDecrypted) as Data
//        }else{
//            if buffer != nil {
//                free(buffer)
//            }
//        }
//        return nil
//    }
//
//}
//MARK: 编码方式转换
//extension Data {
//    
//    var utf8String: String{
//        guard let utf8S = String.init(data: self, encoding: .utf8) else { return "" }
//        return utf8S
//    }
//    
//    var base64Encode: Data{
//        self.base64EncodedData(options: .lineLength64Characters)
//    }
//    
//    var base64Decode: Data{
//        guard let data = Data.init(base64Encoded: self, options: .ignoreUnknownCharacters) else { return Data() }
//        return data
//    }
//    
//    
//}


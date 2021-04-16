//
//  IPAddressTool.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/4/9.
//


struct IPAddressTool {
    /// 获取当前设备IP
    static var deviceIP: String? {
        var addresses = [String]()
        var ifaddr : UnsafeMutablePointer<ifaddrs>? = nil
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while (ptr != nil) {
                let flags = Int32(ptr!.pointee.ifa_flags)
                var addr = ptr!.pointee.ifa_addr.pointee
                if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                    if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        if (getnameinfo(&addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                            if let address = String(validatingUTF8:hostname) {
                                addresses.append(address)
                            }
                        }
                    }
                }
                ptr = ptr!.pointee.ifa_next
            }
            freeifaddrs(ifaddr)
        }
        return addresses.first
    }
    ///获取本机无线局域网IP
    static var wifiIP: String? {
        
        var address: String?
        var ifaddr: UnsafeMutablePointer<ifaddrs>? = nil
        guard getifaddrs(&ifaddr) == 0 else {
            return nil
        }
        guard let firstAddr = ifaddr else {
            return nil
        }
         
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            // Check for IPV4 or IPV6 interface
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                // Check interface name
                let name = String(cString: interface.ifa_name)
                if name == "en0" {
                    // Convert interface address to a human readable string
                    var addr = interface.ifa_addr.pointee
                    var hostName = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(&addr,socklen_t(interface.ifa_addr.pointee.sa_len), &hostName, socklen_t(hostName.count), nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostName)
                }
            }
        }
         
        freeifaddrs(ifaddr)
        return address
    }
    
    ///获得公网IP
    static func publicIP(backBlock: @escaping ((String)->())){
            
             
        let ipURL = URL(string: "http://pv.sohu.com/cityjson?ie=utf-8")
         
        var ip: String? = nil
        do {
            if let ipURL = ipURL {
                ip = try String(contentsOf: ipURL, encoding: String.Encoding(rawValue: String.Encoding.utf8.rawValue))
            }
        } catch {
        }
        //判断返回字符串是否为所需数据
        if ip?.hasPrefix("var returnCitySN = ") ?? false {
            //对字符串进行处理，然后进行json解析
            //删除字符串多余字符串
            let range = NSRange(location: 0, length: 19)
            if let subRange = Range<String.Index>(range, in: ip ?? "") { ip?.removeSubrange(subRange) }
            let nowIp = (ip as NSString?)?.substring(to: (ip?.count ?? 0) - 1)
            //将字符串转换成二进制进行Json解析
            let data = nowIp?.data(using: .utf8)
            var dict: [String : Any]? = nil
            do {
                if let data = data {
                    dict = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
                }
            } catch {
            }
            if let dict = dict {
                print("\(dict)")
            }
            backBlock(dict?["cip"] as? String ?? "")
        }
        backBlock("")
    }
}

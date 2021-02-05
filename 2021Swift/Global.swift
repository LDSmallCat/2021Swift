//
//  Global.swift
//  SwiftPracticeProject
//
//  Created by 曹来东 on 2021/2/4.
//

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let defaultCellHeight: CGFloat = 80

let navgationBarHeight: CGFloat = 44.0
let statusBarHeight: CGFloat = isIphoneX ? 44.0 : 20.0
let tabBarHeight: CGFloat = 49 + UIWindow().safeAreaInsets.bottom

/// 宽度比例缩放
/// - Parameters:
///   - originalWidth: 设计图上标注宽度
///   - originalReferenceWidth: 设计图上标宽度 参照的 父视图宽度（屏幕宽度）
///   - currentReferenceWidth: 当前参照的 父试图宽度（屏幕宽度）
/// - Returns: 当前参照的 父试图宽度（屏幕宽度）上对应的宽度
func ld_scaleWidth(_ originalWidth: CGFloat ,_ originalReferenceWidth: CGFloat = 375.0,_ currentReferenceWidth: CGFloat = screenWidth) -> CGFloat{
    let scale = originalWidth / originalReferenceWidth
    return currentReferenceWidth * scale
}

/// URL图片数组
let imageUrlArray = [
    "https://cover.u17i.com/2018/09/1310592_1538034437_jusi2idL66Sr.sbig.jpg",
    "https://cover.u17i.com/2020/05/3674833_1590765609_8OBOjRK4eigJ.sbig.jpg",
    "https://cover.u17i.com/2020/07/12647_1593934116_T80OWo1GGkWG.sbig.jpg",
    "https://cover.u17i.com/2020/07/12647_1593934116_T80OWo1GGkWG.sbig.jpg"
]

/// 文字数组
let testArray = [
    "全省常住人口[2]为27462297人。同第五次全国人口普查2000年11月1日零时的27279921人相比，十年共增加182406人，增长0.67%。年平均增长率为0.07%。1",
    "全省常住人口中共有家庭户9001598户，家庭户人口为26466906人，平均每个家庭户的人口为2.94人，比2000年第五次全国人口普查的3.32人减少了0.38人。2",
    "全省常住人口中，男性为13912019人，占总人口的50.66%；女性为13550278人，占总人口的49.34%。总人口性别比（以女性为100，男性对女性的比例）由2000年第五次全国人口普查的104.92下降为102.67。3",
    "全省常住人口中，0-14岁的人口为3292657人，占11.99%；15-64的人口为21867007人，占79.63%；65岁及以上的人口为2302633人，占的8.38%。同2000年第五次全国人口普查相比，0-14岁人口的比重下降了6.97个百分点，15-64岁人口的比重上升了4.44个百分点，65岁及以上人口的比重上升了2.53个百分点。4"
]

//var topVC: UIViewController? {
//    var resultVC: UIViewController?
//    let appDelegate = UIApplication.shared.keyWindow
//    
//    
//    resultVC = _topVC(UIApplication.shared.keyWindow?.rootViewController)
//    while resultVC?.presentedViewController != nil {
//        resultVC = _topVC(resultVC?.presentedViewController)
//    }
//    return resultVC
//}
//
//private func _topVC(_ vc: UIViewController?) -> UIViewController? {
//      
//       if vc is UINavigationController {
//               return _topVC((vc as? UINavigationController)?.topViewController)
//           } else if vc is UITabBarController {
//               return _topVC((vc as? UITabBarController)?.selectedViewController)
//           } else {
//               return vc
//           }
//}

//MARK: print
func lPrint<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):funciton:\(function):line:\(lineNumber)]- \(message)")
    #endif
}

var isIphoneX: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
        || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896)
}

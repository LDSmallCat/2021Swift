//
//  Global.swift
//  SwiftPracticeProject
//
//  Created by 曹来东 on 2021/2/4.
//

let screenWidth = UIScreen.main.bounds.width
let screenHeight = UIScreen.main.bounds.height
let defaultCellHeight: CGFloat = 80

//let navgationBarHeight: CGFloat = 44.0
//let statusBarHeight: CGFloat = isIphoneX ? 44.0 : 20.0
//let tabBarHeight: CGFloat = 49 + UIWindow().safeAreaInsets.bottom
//MARK: - 宽度比例缩放
/// 宽度比例缩放
/// - Parameters:
///   - originalWidth: 设计图上标注宽度
///   - originalReferenceWidth: 设计图上标注宽度 参照的 父视图宽度（屏幕宽度）
///   - currentReferenceWidth: 当前参照的 父试图宽度（屏幕宽度）
/// - Returns: 当前参照的 父试图宽度（屏幕宽度）上对应的宽度
func ld_scaleWidth(_ originalWidth: CGFloat ,_ originalReferenceWidth: CGFloat = 375.0,_ currentReferenceWidth: CGFloat = screenWidth) -> CGFloat{
    let scale = originalWidth / originalReferenceWidth
    return currentReferenceWidth * scale
}

//MARK: - 获取当前显示的控制器对象
var topVC: UIViewController? {
    var resultVC: UIViewController?
    
    resultVC = _topVC(keyWindow?.rootViewController)
    while resultVC?.presentedViewController != nil {
        resultVC = _topVC(resultVC?.presentedViewController)
    }
    return resultVC
}

private func _topVC(_ vc: UIViewController?) -> UIViewController? {
      
   if vc is UINavigationController {
           return _topVC((vc as? UINavigationController)?.topViewController)
       } else if vc is UITabBarController {
           return _topVC((vc as? UITabBarController)?.selectedViewController)
       } else {
           return vc
       }
}

//MARK: - print
func lPrint<T>(_ message: T, file: String = #file, function: String = #function, lineNumber: Int = #line) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
    print("[\(fileName):funciton:\(function):line:\(lineNumber)]- \(message)")
    #endif
}
//MARK: - isIphoneX
var isIphoneX: Bool {
    return UIDevice.current.userInterfaceIdiom == .phone
        && (max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 812
        || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 896
        || max(UIScreen.main.bounds.height, UIScreen.main.bounds.width) == 844)
        
}
//MARK: - 获取keyWindow
var keyWindow: UIWindow? {
        struct Static {
            /** @abstract   Save keyWindow object for reuse.
            @discussion Sometimes [[UIApplication sharedApplication] keyWindow] is returning nil between the app.   */
            static weak var keyWindow: UIWindow?
        }

        var originalKeyWindow : UIWindow? = nil
        
        #if swift(>=5.1)
        if #available(iOS 13, *) {
            originalKeyWindow = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })
        } else {
            originalKeyWindow = UIApplication.shared.keyWindow
        }
        #else
        originalKeyWindow = UIApplication.shared.keyWindow
        #endif

        //If original key window is not nil and the cached keywindow is also not original keywindow then changing keywindow.
        if let originalKeyWindow = originalKeyWindow {
            Static.keyWindow = originalKeyWindow
        }

        //Return KeyWindow
        return Static.keyWindow
}
//MARK: - 状态栏高度
var statusBarHeight: CGFloat {
    let statusBarHeight : CGFloat
    
    #if swift(>=5.1)
    if #available(iOS 13, *) {
        statusBarHeight = keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
    } else {
        statusBarHeight = UIApplication.shared.statusBarFrame.height
    }
    #else
    statusBarHeight = UIApplication.shared.statusBarFrame.height
    #endif
    
    return statusBarHeight
}
//MARK: - 导航栏高度
var navgationBarHeight: CGFloat {
    return topVC?.navigationController?.navigationBar.frame.height ?? 0
}
//MARK: - 导航栏+ 状态栏 高度
var navigationBarAreaHeight: CGFloat {
    return statusBarHeight + (topVC?.navigationController?.navigationBar.frame.height ?? 0)
}

//
//  BaseNavigationController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class BaseNavigationController: UINavigationController {
    ///导航栏底部分割线
    var navLine: UIImageView? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
      
        guard let line = navigationBar.subviews.first?.subviews.last else { return  }
        if line.isMember(of: NSClassFromString("_UIBarBackgroundShadowView")!) {
            //_UIBarBackgroundShadowContentImageView
            navLine = line.subviews.last as? UIImageView
            navLine?.isHidden = true
        }
         
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? BaseViewController {
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(norImage: "nav_back_black", selImage: "nav_back_black", imageEdgeInsets: UIEdgeInsets(top: 0, left: 17, bottom: 0, right: 0), target: vc, action: #selector(vc.backButtonClick))
            }
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    deinit {
        debugPrint(self.className + "销毁")
    }
}

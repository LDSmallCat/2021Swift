//
//  BaseNavigationController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    

    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 1 {
            viewController.hidesBottomBarWhenPushed = true
            if let vc = viewController as? BaseViewController {
                vc.navigationItem.leftBarButtonItem = UIBarButtonItem(norImage: "nav_back_white", selImage: "nav_back_white", target: vc, action: #selector(vc.backButtonClick))
            }
        }
        super.pushViewController(viewController, animated: animated)
    }

}

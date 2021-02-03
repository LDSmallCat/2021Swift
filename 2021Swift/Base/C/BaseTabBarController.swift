//
//  BaseTabBarController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class BaseTabBarController: UITabBarController {
    let titleArray = ["首页","通讯录","发现","我"]
    let imagesArray = ["tabbar_mainframe","tabbar_contacts","tabbar_discover","tabbar_me"]
    let vcs: [UIViewController] = [
                HomeViewController(),VoiceViewController(),
                VideoViewController(),MineViewController()
              ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addChilds()
    }
    
    
}
extension BaseTabBarController {
    
    func addChilds() {
        for index in 0 ..< titleArray.count {
            let title = titleArray[index]
            let norImage = imagesArray[index]
            
            let vc = vcs[index]
            addChild(title: title, imageString: norImage, viewController: vc)
            
        }
    }
    
    func addChild(title: String,imageString: String, viewController: UIViewController) {
        
        let child = BaseNavigationController(rootViewController: viewController)
        
        child.tabBarItem.image = UIImage(named: imageString)?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.selectedImage = UIImage(named: imageString.appending("_S"))?.withRenderingMode(.alwaysOriginal)
        child.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor  : UIColor(r: 123, g: 123, b: 123)
            ], for: .normal)
        child.tabBarItem.setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor  : UIColor(r: 26, g: 178, b: 10)
            ], for: .selected)
        child.tabBarItem.title = title
        addChild(child)
    }

}

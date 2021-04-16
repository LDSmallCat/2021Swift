//
//  BaseViewController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        configUI()
        configLayout()
    }
    deinit {
        debugPrint(self.className + "销毁")
    }
}
//MARK: 网络请求
extension BaseViewController {
    @objc func loadData() { }
}
//MARK: 添加子视图，子视图 布局
extension BaseViewController {
    @objc func configUI() { }
    @objc func configLayout() { }
}
//MARK: 左上角 返回按钮点击事件
extension BaseViewController {
    
    @objc func backButtonClick() {
        self.navigationController?.popViewController(animated: true)
    }
}

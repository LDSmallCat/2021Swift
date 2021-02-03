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
        //view.backgroundColor = UIColor.random
    }

}

extension BaseViewController {
    @objc func backButtonClick() {
        self.navigationController?.popViewController(animated: true)
    }
}

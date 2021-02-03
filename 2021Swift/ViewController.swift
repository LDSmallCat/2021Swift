//
//  ViewController.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/3.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.red
        print(UIScreen.main.bounds)
        print(UIDevice.current.name)
        //iPhone 12 mini (0.0, 0.0, 375.0, 812.0)
        //“caolaidong”的 iPhone (0.0, 0.0, 414.0, 736.0)
    }


}


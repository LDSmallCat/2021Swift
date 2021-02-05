//
//  BaseCollectionReusableView.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/4.
//

import UIKit

class BaseCollectionReusableView: UICollectionReusableView {
    var navgationController: UINavigationController?
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lineColor
        line.isHidden = true
        return line
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func configUI() {
        addSubview(line)
    }
    @objc func configLayout() {
        line.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
    }
}

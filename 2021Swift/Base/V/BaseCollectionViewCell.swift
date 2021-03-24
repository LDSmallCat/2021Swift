//
//  BaseCollectionViewCell.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/4.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    var navgationController: UINavigationController?
    
    lazy var backView: UIView = {
        let back = UIView()
        line.isHidden = true
        return back
    }()
    
    lazy var line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.lineColor
        line.isHidden = true
        return line
    }()
    
    lazy var testLabel: UILabel = {
        let lb = UILabel()
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configLayout()
    }
    
    
    @objc func configUI() {
        addSubview(backView)
        addSubview(testLabel)
        addSubview(line)
    }
    
    @objc func configLayout() {
        backView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        line.snp.makeConstraints{
            $0.left.right.bottom.equalToSuperview()
            $0.height.equalTo(0.5)
        }
        testLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

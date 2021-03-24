//
//  HomeSectionOneCollectionReusableView.swift
//  2021Swift
//
//  Created by 曹来东 on 2021/2/5.
//

import UIKit

class HomeSectionOneCollectionReusableView: BaseCollectionReusableView {
    lazy var verLine: UIImageView = {
        let vl = UIImageView()
        vl.backgroundColor = UIColor.random
        return vl
    }()
    
    lazy var titleLabel: UILabel = {
        let lab = UILabel()
        lab.font = UIFont.boldSystemFont(ofSize: 15)
        lab.textColor = UIColor.textBlackColor
        lab.text = "产品编码"
        return lab
    }()
    
    lazy var moreButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setTitle("更多", for: .normal)
        btn.setImage(UIImage(named: "App_rightArrow"), for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        btn.addTarget(self, action: #selector(self.moreButtonClick(moreButton:)), for: .touchUpInside)
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -65)
        btn.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        btn.setTitleColor(UIColor.textPlaceHolderColor, for: .normal)
        return btn
    }()
    
    override func configUI() {
        super.configUI()
        line.isHidden = false
        backgroundColor = UIColor.backWhiteColor
        addSubview(verLine)
        addSubview(moreButton)
        addSubview(titleLabel)
    }
    
    override func configLayout() {
        super.configLayout()
        verLine.snp.makeConstraints{
            $0.left.leftMargin.equalTo(10)
            $0.centerY.equalToSuperview()
            $0.width.equalTo(3)
            $0.height.equalTo(15)
        }
        
        moreButton.snp.makeConstraints{
            $0.right.equalToSuperview().offset(-12)
            $0.bottom.top.equalToSuperview()
            $0.width.equalTo(45)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.left.equalTo(verLine.snp.right).offset(5)
            $0.right.lessThanOrEqualTo(moreButton.snp.left).offset(-5)
        }
    }
}
extension HomeSectionOneCollectionReusableView {
    @objc func moreButtonClick(moreButton: UIButton) {
        lPrint("moreButtonClick")
    }
}
